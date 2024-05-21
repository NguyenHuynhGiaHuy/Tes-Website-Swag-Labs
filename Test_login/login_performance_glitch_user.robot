*** Settings ***
Library           SeleniumLibrary
Library           DateTime

*** Variables ***
${BROWSER}                  Chrome
${URL}                      https://www.saucedemo.com/
${EXPECTED_URL}             https://www.saucedemo.com/inventory.html
${VALID_PASSWORD}           secret_sauce
${PERFORMANCE_USER}         performance_glitch_user
${STANDARD_USER_USERNAME}   standard_user

*** Test Cases ***
Compare Login Time for Users
    [Documentation]    Kiểm tra đăng nhập với tên tài khoản PERFORMANCE_USER
    ${performance_execution_time}    Login and Get Execution Time    ${PERFORMANCE_USER}    ${VALID_PASSWORD}
    Run Keyword And Continue On Failure    Check Performance Execution Time    ${performance_execution_time}

    ${standard_execution_time}    Login and Get Execution Time    ${STANDARD_USER_USERNAME}    ${VALID_PASSWORD}
    Run Keyword If    '${performance_execution_time}' is not None and '${standard_execution_time}' is not None
    ...    Compare Execution Time    ${performance_execution_time}    ${standard_execution_time}    ${PERFORMANCE_USER}    ${STANDARD_USER_USERNAME}
    [Teardown]    Close All Browsers

*** Keywords ***
Login and Get Execution Time
    [Arguments]    ${username}    ${password}
    ${start_time}    Get Time    epoch
    Open Browser    ${URL}    ${BROWSER}
    Login    ${username}    ${password}
    Wait Until Page Contains    Products
    ${end_time}    Get Time    epoch
    ${execution_time}    Evaluate    ${end_time} - ${start_time}
    RETURN    ${execution_time}

Login
    [Arguments]    ${username}    ${password}
    Input Text    id=user-name    ${username}
    Input Password    id=password    ${password}
    Click Button    css=#login-button
    Wait Until Page Contains Element    css=.inventory_list

Check Performance Execution Time
    [Arguments]    ${performance_execution_time}
    Run Keyword If    '${performance_execution_time}' is None
    ...    Fail    PERFORMANCE_USER gặp vấn đề về hiệu suất: Thời gian đăng nhập không được ghi nhận.

Compare Execution Time
    [Arguments]    ${time1}    ${time2}    ${user1}    ${user2}
    Log    Thời gian chạy đăng nhập với tài khoản ${user1}: ${time1} giây
    Log    Thời gian chạy đăng nhập với tài khoản ${user2}: ${time2} giây
    Run Keyword If    '${time1}' != 'None' and '${time2}' != 'None'
    ...    Compare Non-None Execution Time    ${time1}    ${time2}    ${user1}    ${user2}
    ...    ELSE
    ...    Log    "Không thể so sánh thời gian: Một trong hai giá trị là None"

Compare Non-None Execution Time
    [Arguments]    ${time1}    ${time2}    ${user1}    ${user2}
    Run Keyword If    '${time1}' > '${time2}'
    ...    Fail    PERFORMANCE_USER gặp vấn đề về hiệu suất: ${user1} chậm hơn ${user2} (${time1} giây so với ${time2} giây)
    ...    ELSE
    ...    Log    "Tài khoản ${user2} đăng nhập nhanh hơn, hoặc bẳng tài khoản ${user1}"
