*** Settings ***
Test Setup        Open Browser    ${URL}    ${BROWSER}
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com/
${USERNAME}       visual_user
${PASSWORD}       secret_sauce

*** Test Cases ***
TC01 Logout Hover State Is Change Color
    [Documentation]    Kiểm tra nút Logout có đổi màu khi Hover không
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Wait Until Element Is Visible    //button[text()='Open Menu']
    Click Button    //button[text()='Open Menu']
    Verify Hover State

TC02 Test Logout Button Is Not Covered By Open Menu
    [Documentation]    Kiểm tra xem nút đăng xuất có được che khuất bởi nút 'Open Menu' không
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    ${Is_visible}    Verify Is_Visible Element    //a[text()='Logout']
    Run Keyword If    ${Is_visible}==True
    ...    Log    Phần tử bị che khuất
    ...    ELSE    Log    Phần tử không bị che khuất

TC03 Test Logout Button Position
    [Documentation]    Kiểm tra xem nút Logout có nằm vị trí đúng thứ tự từ trên đếm xuống thuộc tập thẻ
    Input Username And Password    ${USERNAME}    ${PASSWORD}    # Đăng nhập với tài khoản visual_user
    Click Button    //button[text()='Open Menu']
    Wait Until Element Is Visible    //a[text()='Logout']
    Find Element Position    //nav[@class='bm-item-list']//a

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

Verify Hover State
    Wait Until Element Is Visible    //a[text()='Logout']
    Mouse Over    //a[text()='Logout']    #Rê chuột tới vị trí nút đăng xuất
    Element Attribute Value Should Be    //a[text()='Logout']    id    logout_sidebar_link    message=None    #Kiểm tra xem nút đăng xuất có thay đổi thuộc tính không

Verify Is_Visible Element
    [Arguments]    ${Verify_element}
    ${Is_visible}    Run Keyword And Return Status    Element Should Not Be Visible    ${Verify_element}    #kiểm tra xem có element ở trang hiện tại không
    Should Be True    ${Is_visible}    #Nếu không có element sẽ trả về True và PASS kiểm tra
    RETURN    ${Is_visible}

Find Element Position
    [Arguments]    ${Element}
    ${Nav_elements}    Get WebElements    ${Element}    # Tìm tất cả các phần tử <a> trong thẻ <nav>
    ${nav_list}    Create List    # Tạo một danh sách trống
    FOR    ${element}    IN    @{nav_elements}
        ${text}    Get Text    ${element}    # Lấy nội dung của mỗi phần tử
        Append To List    ${nav_list}    ${text}    # Thêm nội dung vào danh sách
    END
    Log    ${nav_list}    # In danh sách ra để kiểm tra
