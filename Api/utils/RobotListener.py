import os
import json
import requests
from collections import Counter
import datetime


class RobotListener(object):
    ROBOT_LISTENER_API_VERSION = 3
    HEADERS = {'Content-Type': 'application/json'}

    def __init__(self, webhook_url, epoch, icon=':squirrel'):
        self.webhook_url = webhook_url
        self.epoch = epoch
        self.icon = icon
        self._suite_status = dict()
        self._test_status = dict()

    def end_test(self, data, result):
        self._test_status[data] = result.passed

    def end_suite(self, data, result):
        self._suite_status[data] = self._test_status
        self._test_status = dict()

    def close(self):
        attachments = self._build_overall_results_attachment()
        self._send_slack_request(attachments) if attachments else None

    def _build_overall_results_attachment(self):
        now = datetime.datetime.now()
        current_time = now.strftime("%d/%m/%Y - %H:%M:%S")
        results = {k: v for test_results in self._suite_status.values() for k, v in test_results.items()}
        return [
        {
            "pretext": "*Error(s) happened on Android Regression Automation : " + current_time + "*",
            "color": "danger",
            "fields": [
                {
                    "title": "Total Tests",
                    "value": len(results.values()),
                    "short": True
                },
                {
                    "title": "Tests Failed",
                    "value": Counter(results.values())[False],
                    "short": True
                },
                {
                    "title": "Tests Passed",
                    "value": Counter(results.values())[True],
                    "short": True
                },
                {
                    "title": "Pass Percentage",
                    "value": "{0:.2f}%".format(
                        float((Counter(results.values())[True]) / float(len(results))) * 100),
                    "short": True
                },
                {
                    "title": "Detail Report",
                    "value": "http://35.240.132.153:4545/Results/" + self.epoch + "/report.html",
                    "short": False
                }

            ],
        }]

    def _send_slack_request(self, attachments):
        try:
            data = {"attachments": attachments, "icon_emoji": self.icon}

            response = requests.post(url=self.webhook_url, data=json.dumps(data), headers=self.HEADERS)
            if response.status_code != 200:
                print('Error in sending data to Slack - Status Code: {0}, Text: {1}'.format(response.status_code,
                                                                                            response.content))
        except Exception as e:
            print(str(e))
