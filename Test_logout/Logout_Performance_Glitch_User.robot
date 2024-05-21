*** Settings ***
Test Setup        Open Browser    ${URL}    ${BROWSER}
Test Teardown     Close Browser
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com/
${USERNAME}       performance_glitch_user
${PASSWORD}       secret_sauce
${USERNAME_STANDARD}    standard_user
${PASSWORD_STANDARD}    secret_sauce

*** Test Cases ***
TC01 Logout After Successful Login
    [Documentation]    Kiểm tra hiệu suất chức năng đăng suất của user performance_glitch so với user standard sau khi đăng nhập thành công
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    ${Execution_time_glitch_user}    Check Execution Time
    Input Username And Password    ${USERNAME_STANDARD}    ${PASSWORD_STANDARD}
    ${Execution_time_standard_user}    Check Execution Time
    Compare Execution Time    ${Execution_time_glitch_user}    ${Execution_time_standard_user}    ${USERNAME}    ${USERNAME_STANDARD}

TC02 Logout From Any Page When Successful Login
    [Documentation]    Kiểm tra hiệu suất chức năng đăng suất của user performance_glitch từ một trang khác sau khi đăng nhập thành công
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Go To    https://www.saucedemo.com/cart.html    #Chuyển tới trang bất kỳ
    ${Execution_time_glitch_user}    Check Execution Time

TC03 Log out When Going To Product Detail Page, Add Product To Cart
    [Documentation]    Kiểm tra hiệu suất chức năng đăng suất của user performance_glitch khi chuyển đến trang chi tiết sản phẩm, thêm sản phẩm vào giỏ hàng
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    See Product Detail And Add To Cart    item_4_img_link
    ${Execution_time_glitch_user}    Check Execution Time

*** Keywords ***
Input Username And Password
    [Arguments]    ${User_name}    ${Password}
    Wait Until Element Is Visible    user-name
    Wait Until Element Is Enabled    user-name
    Input Text    user-name    ${User_name}    #Nhập thông tin tên đăng nhập
    Wait Until Element Is Visible    password
    Wait Until Element Is Enabled    password
    Input Password    password    ${Password}    #Nhập thông tin mật khẩu
    Wait Until Element Is Visible    login-button
    Wait Until Element Is Enabled    login-button
    Click Element    login-button    #Chọn nút đăng nhập
    Wait Until Element Is Visible    //button[text()='Open Menu']

Click Logout Button
    Wait Until Element Is Visible    //button[text()='Open Menu']
    Click Button    //button[text()='Open Menu']    #Mở nút Open Menu
    Wait Until Element Is Visible    //a[text()='Logout']
    Click Link    //a[text()='Logout']    #Chọn nút đăng xuất

Check Execution Time
    ${Start_time}    Get Time    epoch    #Bắt đầu đo hiệu suất
    Click Logout Button
    ${End_time}    Get Time    epoch    #Kết thúc đo hiệu suất
    ${Execution_time}    Evaluate    ${End_time} - ${Start_time}    #kết quả hiệu suất
    Log    Thời gian đăng xuất của người dùng performance_glitch_user: ${Execution_time} seconds
    RETURN    ${Execution_time}    #Trả về kết quả hiệu suất

Compare Execution Time
    [Arguments]    ${Execution_time_1}    ${Execution_time_2}    ${User_name_1}    ${User_name_2}
    Run Keyword If    ${Execution_time_1} == ${Execution_time_2}
    ...    Log    Hiệu suất của cả hai người dùng là như nhau
    ...    ELSE IF    ${Execution_time_1} < ${Execution_time_2}    Log    ${User_name_1} có hiệu suất cao hơn ${User_name_2}
    ...    ELSE    Log    ${User_name_2} có hiệu suất cao hơn ${User_name_1}

See Product Detail And Add To Cart
    [Arguments]    ${Product_detail}
    Click Element    ${Product_detail}    #Chọn xem chi tiết sản phầm
    Wait Until Element Is Visible    add-to-cart
    Click Button    add-to-cart    #Thêm sản phẩm vào giỏ hàng
