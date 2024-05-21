*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com/
${EXPECTED_URL}     https://www.example.com/dashboard
${VALID_PASSWORD}    secret_sauce


*** Test Cases ***
Locked Out User Test
    [Documentation]    Kiểm tra đăng nhập với người dùng bị khóa
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    id=user-name    locked_out_user    # Nhập tên người dùng bị khóa vào trường có id=user-name
    Input Text    id=password    ${VALID_PASSWORD}    # Nhập mật khẩu vào trường có id=password
    Click Button    css=#login-button    # Nhấn vào nút đăng nhập
    Page Should Contain    Sorry, this user has been locked out.    # Kiểm tra xem trang có chứa thông báo "Sorry, this user has been locked out." không.
    [Teardown]    Close All Browsers
