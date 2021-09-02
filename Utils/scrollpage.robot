*** Settings ***
Library     AppiumLibrary       timeout=10

*** Keywords ***
Short Scrolling Down
    [Arguments]     ${locator}      ${times}

    FOR    ${index}    IN RANGE    0    ${times}
        ${element_size}=        Get Element Size        ${locator}
        ${element_location}=    Get Element Location    ${locator}
        ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
        ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.4)
        ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
        ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
        Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
    END

Long Scrolling Down
    [Arguments]     ${locator}      ${times}

    ${element_size}=        Get Element Size        ${locator}
    ${element_location}=    Get Element Location    ${locator}

    FOR    ${index}    IN RANGE    0    ${times}
        ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
        ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.7)
        ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
        ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
        Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
    END

Swipe Right
    [Arguments]     ${locator}      ${times}

    FOR    ${index}    IN RANGE    0    ${times}
        ${element_size}=        Get Element Size        ${locator}
        ${element_location}=    Get Element Location    ${locator}
        ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.7)
        ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.5)
        ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
        ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.5)
        Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
    END

Swipe Left
    [Arguments]     ${locator}      ${times}

    FOR    ${index}    IN RANGE    0    ${times}
        ${element_size}=        Get Element Size        ${locator}
        ${element_location}=    Get Element Location    ${locator}
        ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
        ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.5)
        ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.7)
        ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.5)
        Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
    END

Full Swipe Left
    [Arguments]     ${locator}      ${times}

    FOR    ${index}    IN RANGE    0    ${times}
            ${element_size}=        Get Element Size        ${locator}
            ${element_location}=    Get Element Location    ${locator}
            ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.9)
            ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.5)
            ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
            ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.5)
            Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
    END

Scroll Up to Element
    [Arguments]     ${element}      ${container}

    wait until page contains element    ${container}

    ${element_size}=        Get Element Size        ${container}
    ${element_location}=    Get Element Location    ${container}

    FOR    ${index}    IN RANGE    1    10
        ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
        ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
        ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
        ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.7)

        ${status}=      run keyword and return status       wait until element is visible       ${element}      timeout=2
        run keyword if  '${status}'=='False'    Swipe      ${start_x}    ${start_y}  ${end_x}  ${end_y}         500
        ...     ELSE    run keyword             Exit For Loop
    END

Scroll Down to Element
    [Arguments]     ${element}      ${container}

    wait until page contains element    ${container}

    ${element_size}=        Get Element Size        ${container}
    ${element_location}=    Get Element Location    ${container}

    FOR    ${index}    IN RANGE    1    10
        ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
        ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.5)
        ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
        ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)

        ${status}=      run keyword and return status       wait until page contains element    ${element}      timeout=2
        run keyword if  '${status}'=='False'    Swipe       ${start_x}    ${start_y}  ${end_x}  ${end_y}        500
        ...     ELSE    run keyword             Exit For Loop
    END
