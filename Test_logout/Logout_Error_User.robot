*** Settings ***
Test Setup        Open Browser    ${URL}    ${BROWSER}
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com/
${USERNAME}       error_user
${PASSWORD}       secret_sauce
${EXPECTED_URL}    https://www.saucedemo.com/checkout-complete.html

*** Test Cases ***
TC01 Logout After Successful Login
    [Documentation]    Logout sau khi đăng nhập thành công
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Click Logout Button

TC02 Logout From Any Page When Successful Login
    [Documentation]    Logout từ một trang khác sau khi đăng nhập thành công
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Go To    https://www.saucedemo.com/cart.html    #Chuyển tới trang bất kỳ
    Click Logout Button

TC03 Logout Hover State Is Change Color
    [Documentation]    Logout Hover State
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Wait Until Element Is Visible    //button[text()='Open Menu']
    Click Button    //button[text()='Open Menu']
    Verify Hover State

TC04 Logout After Moving Product Detail Page, Add Product To Cart
    [Documentation]    Đăng xuất sau khi chuyển đến trang chi tiết sản phẩm, thêm sản phẩm vào giỏ hàng
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    See Product Detail And Add To Cart    item_4_img_link
    Click Logout Button

TC05 Log Out After Going To The Checkout Page And Entering Your Payment Information
    [Documentation]    Đăng xuất sau khi chuyển đến trang thanh toán và nhập thông tin thanh toán
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Check Cart And Checkout
    Fill Payment Info    firstname    lastname    12345
    Click Logout Button

TC06 Log Out After Going To The Checkout Page And Don't Entering Your Payment Information
    [Documentation]    Đăng xuất sau khi chuyển đến trang thanh toán và không nhập thông tin thanh toán
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Check Cart And Checkout
    Fill Payment Info
    Click Logout Button

TC07 Log Out After Successful Payment Error
    [Documentation]    đăng xuất sau khi thanh toán thành công bị lỗi
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Check Cart And Checkout
    Fill Payment Info    firstname    lastname    12345
    Click Element    continue
    Wait Until Element Is Visible    finish
    Click Element    finish
    Verify URL Is Visible    ${EXPECTED_URL}

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

Click Logout Button
    Wait Until Element Is Visible    //button[text()='Open Menu']
    Click Button    //button[text()='Open Menu']    #Mở nút Open Menu
    Wait Until Element Is Visible    //a[text()='Logout']
    Click Link    //a[text()='Logout']    #Chọn nút đăng xuất

See Product Detail And Add To Cart
    [Arguments]    ${Product_detail}
    Click Element    ${Product_detail}    #Chọn xem chi tiết sản phầm
    Wait Until Element Is Visible    add-to-cart
    Click Button    add-to-cart    #Thêm sản phẩm vào giỏ hàng

Check Cart And Checkout
    Click Link    //a[@class='shopping_cart_link']
    Click Button    Checkout

Fill Payment Info
    [Arguments]    ${First_Name}=${EMPTY}    ${Last_Name}=${EMPTY}    ${ZipOrPos_Code}=${EMPTY}
    Wait Until Element Is Visible    firstName
    Input Text    firstName    ${First_Name}
    Wait Until Element Is Visible    lastName
    Input Text    lastName    ${Last_Name}
    Wait Until Element Is Visible    postalCode
    Input Text    postalCode    ${ZipOrPos_Code}

Verify Hover State
    Wait Until Element Is Visible    //a[text()='Logout']
    Mouse Over    //a[text()='Logout']    #Rê chuột tới vị trí nút đăng xuất
    Element Attribute Value Should Be    //a[text()='Logout']    id    logout_sidebar_link    message=None    #Kiểm tra xem nút đăng xuất có thay đổi thuộc tính không

Verify URL Is Visible
    [Arguments]    ${EXPECTED_URL}
    ${current_URL}    Get Location
    ${Status}    Run Keyword And Return Status    Should Not Be Equal As Strings    ${current_URL}    ${EXPECTED_URL}
    Should Be True    ${Status}
