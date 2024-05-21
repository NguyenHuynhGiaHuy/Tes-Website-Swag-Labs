*** Settings ***
Test Setup        Open Browser    ${URL}    ${BROWSER}
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com/
${USERNAME}       locked_out_user
${PASSWORD}       secret_sauce

*** Test Cases ***
TC01 Logout After Login With Locked User
    [Documentation]    Kiểm tra xem có nút đăng xuất sau khi đăng nhập bằng tài khoản bị khoá hay không
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Verify Is_Visible Element    //a[text()='Logout']

TC02 Logout From Any Page After A Failed Login
    [Documentation]    Kiểm tra có nút Logout từ một trang khác sau khi đăng nhập bằng tài khoản bị khoá hay không
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Go To    https://www.saucedemo.com/cart.html    #Chuyển tới trang bất kỳ
    Verify Is_Visible Element    //a[text()='Logout']

*** Keywords ***
Input Username And Password
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Wait Until Element Is Visible    user-name
    Wait Until Element Is Enabled    user-name
    Input Text    user-name    ${USERNAME}    #Nhập thông tin tên đăng nhập
    Wait Until Element Is Visible    password
    Wait Until Element Is Enabled    password
    Input Password    password    ${PASSWORD}    #Nhập thông tin mật khẩu
    Wait Until Element Is Visible    login-button
    Wait Until Element Is Enabled    login-button
    Click Element    login-button    #Chọn nút đăng nhập

Verify Is_Visible Element
    [Arguments]    ${Verify_element}
    ${Is_visible}    Run Keyword And Return Status    Element Should Not Be Visible    ${Verify_element}    #kiểm tra xem có element ở trang hiện tại không
    Should Be True    ${Is_visible}    #Nếu không có element sẽ trả về True và PASS kiểm tra
