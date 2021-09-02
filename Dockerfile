FROM alpine:3.7

RUN apk add --no-cache python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi

RUN pip3 install robot && \
    pip3 install selenium && \
    pip3 install robotframework && \
    pip3 install robotframework-seleniumlibrary && \
    pip3 install robotframework-pabot && \
    pip3 install robotremoteserver && \
    pip3 install robotframework-jsonlibrary && \
    pip3 install robotframework-requests && \
    pip3 install requests && \
    pip3 install robotframework-appiumlibrary && \
    pip3 install -U robotframework-redislibrary

WORKDIR /app

COPY . .
