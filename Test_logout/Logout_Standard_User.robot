*** Settings ***
Test Setup        Open Browser    ${URL}    ${BROWSER}
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com/
${USERNAME}       standard_user
${PASSWORD}       secret_sauce
${INVALID_USERNAME}    invalid_user
${INVALID_PASSWORD}    invalid_password
${INVALID_INFO}    @@@@@
${SPACE_INFO}     _ A A A
${SHORT_INFO}     A
${LONG_INFO}      AAAAAAAAAAAAAAAAAAAAAAAAAAAA

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

TC03 Logout From Any Page After A Failed Login
    [Documentation]    Logout từ một trang khác sau khi đăng nhập không thành công
    Input Username And Password Invalid    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Go To    https://www.saucedemo.com/cart.html    #Chuyển tới trang bất kỳ
    Verify Is_Visible Element    //a[text()='Logout']

TC04 Logout While Performing Action On Dashboard
    [Documentation]    Thực hiện một hành động trên trang chính và đăng xuất
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product To Cart    add-to-cart-sauce-labs-backpack
    Click Logout Button

TC05 Logout Hover State Is Change Color
    [Documentation]    Logout Hover State
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Wait Until Element Is Visible    //button[text()='Open Menu']
    Click Button    //button[text()='Open Menu']
    Verify Hover State

TC06 Logout Without Logging In
    [Documentation]    Đăng xuất khi chưa đăng nhập
    Verify Is_Visible Element    //a[text()='Logout']

TC07 Logout Without Successfully Logging In
    [Documentation]    Đăng xuất khi chưa đăng nhập thành công
    Input Username And Password Invalid    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Verify Is_Visible Element    //a[text()='Logout']

TC08 Log out When Going To Product Detail Page, Add Product To Cart
    [Documentation]    Đăng xuất khi chuyển đến trang chi tiết sản phẩm, thêm sản phẩm vào giỏ hàng
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    See Product Detail And Add To Cart    item_4_img_link
    Click Logout Button

TC09 Log Out After Going To The Checkout Page And Entering Your Payment Information
    [Documentation]    Đăng xuất sau khi chuyển đến trang thanh toán và nhập thông tin thanh toán
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Check Cart And Checkout
    Fill Payment Info    firstname    lastname    12345
    Click Logout Button

TC10 Log Out After Going To The Checkout Page And Don't Entering Your Payment Information
    [Documentation]    Đăng xuất sau khi chuyển đến trang thanh toán và không nhập thông tin thanh toán
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Check Cart And Checkout
    Fill Payment Info
    Click Logout Button

TC11 Log Out After Going To The Checkout Page And Entering Invalid Payment Information
    [Documentation]    Đăng xuất sau khi chuyển đến trang thanh toán và nhập thông tin thanh toán không hợp lệ
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Check Cart And Checkout
    Fill Payment Info    ${INVALID_INFO}    ${INVALID_INFO}    ${INVALID_INFO}
    Click Logout Button

TC12 Log Out After Going To The Checkout Page And Entering Payment Information With Blanks
    [Documentation]    Đăng xuất sau khi chuyển đến trang thanh toán và nhập thông tin thanh toán có khoản trắng
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Check Cart And Checkout
    Fill Payment Info    ${SPACE_INFO}    ${SPACE_INFO}    ${SPACE_INFO}
    Click Logout Button

TC13 Log Out After Going To The Checkout Page And Entering Payment Information Is Too Short
    [Documentation]    Đăng xuất sau khi chuyển đến trang thanh toán và nhập thông tin thanh toán quá ngắn
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Check Cart And Checkout
    Fill Payment Info    ${SHORT_INFO}    ${SHORT_INFO}    ${SHORT_INFO}
    Click Logout Button

TC14 Log Out After Going To The Checkout Page And Entering Payment Information Is Too Long
    [Documentation]    Đăng xuất sau khi chuyển đến trang thanh toán và nhập thông tin thanh toán quá dài
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Check Cart And Checkout
    Fill Payment Info    ${LONG_INFO}    ${LONG_INFO}    ${LONG_INFO}
    Click Logout Button

TC15 Log Out After Entering Payment Information But Not Confirming The Finish
    [Documentation]    Đăng xuất sau khi nhập thông tin thanh toán nhưng không xác nhận mua hàng
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Check Cart And Checkout
    Fill Payment Info    firstname    lastname    12345
    Click Element    continue
    Click Logout Button

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

Input Username And Password Invalid
    [Arguments]    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Wait Until Element Is Visible    user-name
    Wait Until Element Is Enabled    user-name
    Input Text    user-name    ${INVALID_USERNAME}    #Nhập thông tin tên đăng nhập
    Wait Until Element Is Visible    password
    Wait Until Element Is Enabled    password
    Input Password    password    ${INVALID_PASSWORD}    #Nhập thông tin mật khẩu
    Wait Until Element Is Visible    login-button
    Wait Until Element Is Enabled    login-button
    Click Element    login-button    #Chọn nút đăng nhập

Click Logout Button
    Wait Until Element Is Visible    //button[text()='Open Menu']
    Click Button    //button[text()='Open Menu']    #Mở nút Open Menu
    Wait Until Element Is Visible    //a[text()='Logout']
    Click Link    //a[text()='Logout']    #Chọn nút đăng xuất

Add Product To Cart
    [Arguments]    ${Button}
    Click Button    ${Button}    #Thêm sản phẩm vào giỏ hàng

Verify Hover State
    Wait Until Element Is Visible    //a[text()='Logout']
    Mouse Over    //a[text()='Logout']    #Rê chuột tới vị trí nút đăng xuất
    Element Attribute Value Should Be    //a[text()='Logout']    id    logout_sidebar_link    message=None    #Kiểm tra xem nút đăng xuất có thay đổi thuộc tính không

Verify Is_Visible Element
    [Arguments]    ${Verify_element}
    ${Is_visible}    Run Keyword And Return Status    Element Should Not Be Visible    ${Verify_element}    #kiểm tra xem có element ở trang hiện tại không
    Should Be True    ${Is_visible}    #Nếu không có element sẽ trả về True và PASS kiểm tra

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
