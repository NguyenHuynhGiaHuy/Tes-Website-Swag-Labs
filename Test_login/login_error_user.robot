*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com/
${EXPECTED_URL}     https://www.saucedemo.com/inventory.html
${ERROR_USER}     error_user
${VALID_PASSWORD}   secret_sauce

*** Test Cases ***
Error User Login Test
    [Documentation]    Kiểm tra đăng nhập với tên người dùng gặp lỗi
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=user-name    ${ERROR_USER}
    Input Text    id=password    ${VALID_PASSWORD}
    Click Button    css=#login-button
    Wait Until Page Contains    Products    timeout=10s    # Chờ đến khi trang chứa nội dung "Products"
    Location Should Be    ${EXPECTED_URL}     # Kiểm tra xem URL có phải là URL của trang chính không
    [Teardown]    Close All Browsers
 
