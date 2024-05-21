*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com/
${VALID_USERNAME}              performance_glitch_user
${VALID_PASSWORD}              secret_sauce
${STANDARD_USER_USERNAME}       standard_user
${COPYRIGHT_TEXT}    © 2024 Sauce Labs. All Rights Reserved. Terms of Service | Privacy Policy

*** Test Cases ***

Test Display Format When Zoomed In
    [Documentation]   Kiểm tra định dạng hiển thị của các item sản phẩm khi phóng to form 
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    Wait Until Page Contains Element    css:.inventory_list   # Chờ đến khi danh sách các mục được tải và hiển thị
    ${items_per_row}    Set Variable    2   # Số lượng mục trên mỗi hàng ngang
    ${items_per_column}    Set Variable    3   # Số lượng mục trên mỗi cột dọc
    ${total_items}    Evaluate    ${items_per_row} * ${items_per_column}   # Tính tổng số mục
    ${item_elements}    Get WebElements    css:.inventory_item   # Lấy danh sách các phần tử mục
    Length Should Be    ${item_elements}    ${total_items}   # Kiểm tra xem số lượng phần tử mục có đúng không
    Close Browser

Test Display Format When Zoomed Out
    [Documentation]   Kiểm tra định dạng hiển thị của các item sản phẩm khi thu nhỏ form 
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    ${total_items}    Set Variable    6   # Số lượng mục trên mỗi hàng dọc khi thu nhỏ màn hình
    ${item_elements}    Get WebElements    css:.inventory_item   # Lấy danh sách các phần tử mục
    Length Should Be    ${item_elements}    ${total_items}   # Kiểm tra xem số lượng phần tử mục có đúng không
    Close Browser

Valid Login Test 
    [Documentation]    Đăng nhập vào và kéo chuột cuối trang 
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    Scroll Element Into View    css=.footer    # Lướt đến phần footer
    Sleep    5s
  [Teardown]    Close All Browsers

Valid Login Test and Click Element twitter
    [Documentation]    Kiểm tra link twitter
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    Scroll Element Into View    css=.footer    # Lướt đến phần footer
    Click Element    css=.social_twitter > a    # Nhấp vào nút "Twitter" trong footer
    [Teardown]    Close All Browsers

Valid Login Test and Click Element facebook
    [Documentation]    Kiểm tra link facebook
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    Scroll Element Into View    css=.footer    # Lướt đến phần footer
    Click Element    css=.social_facebook > a    # Nhấp vào nút "facebook" trong footer
    Sleep    5s

    [Teardown]    Close All Browsers

 Valid Login Test and Click Element linkedin
    [Documentation]    Kiểm tra link linkedin
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    Scroll Element Into View    css=.footer    # Lướt đến phần footer
    Click Element    css=.social_linkedin > a    # Nhấp vào nút "facebook" trong footer
    Sleep    5s
    [Teardown]    Close All Browsers   

 Valid Login Test and COPYRIGHT_TEXT
    [Documentation]    Kiểm tra chữ quyền riêng tư có hiển thị hay không
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    Scroll Element Into View    css=.footer    # Lướt đến phần footer
    Page Should Contain    ${COPYRIGHT_TEXT}    # Kiểm tra chữ quyền riêng tư có hiển thị hay không
    Sleep    5s
    [Teardown]    Close All Browsers


Valid Login Test and click button menu
    [Documentation]    Kiểm tra chức năng button menu
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    Click Button    css=#react-burger-menu-btn
    Sleep    5s
  [Teardown]    Close All Browsers

Valid Login Test and Click Button Menu and Print item
    [Documentation]    Kiểm tra chức năng button menu và in ra các item
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button    # Nhấp vào nút đăng nhập
    Page Should Contain    Products    # Kiểm tra trang hiển thị có chứa "Products" không
    Click Button    css=#react-burger-menu-btn    # Nhấp vào nút menu
    Sleep    5s    # Chờ 5 giây để menu mở
    ${menu_items}    Get WebElements    css=.bm-item-list > a
    FOR    ${item}    IN    @{menu_items}
        Log    ${item.text}
    END
    Close All Browsers
    
Valid Login Test and Click Button Menu and Print item1
    [Documentation]    Kiểm tra chức năng button menu và in ra các item
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button    # Nhấp vào nút đăng nhập
    Page Should Contain    Products    # Kiểm tra trang hiển thị có chứa "Products" không
    Click Button    css=#react-burger-menu-btn    # Nhấp vào nút menu
    Sleep    5s    # Chờ 5 giây để menu mở
    ${menu_items}    Get WebElements    css=.bm-item-list > a
    FOR    ${item}    IN    @{menu_items}
        Log    ${item.text}
    END
    Close All Browsers

Test click All item
    [Documentation]    Test click All item in menu
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    Click Button    css=#react-burger-menu-btn    # Nhấp vào nút menu
    Sleep    2s
    Click Element    css=#inventory_sidebar_link
    Sleep    5s
  [Teardown]    Close All Browsers

 Test click About
    [Documentation]    Test click About 
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    Click Button    css=#react-burger-menu-btn    # Nhấp vào nút menu
    Sleep    2s
    Click Element    css=#about_sidebar_link
    Sleep    5s
  [Teardown]    Close All Browsers
  
 Test click Logout
    [Documentation]    Test click Logout và có hiện về trang đăng nhập hay không
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    Click Button    css=#react-burger-menu-btn    # Nhấp vào nút menu
    Sleep    2s
    Click Element    css=#logout_sidebar_link
    Page Should Contain    Swag Labs
    Sleep    5s
  [Teardown]    Close All Browsers

 Test click Reset App State
    [Documentation]     Test click Reset App State
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    Click Button    css=#react-burger-menu-btn    # Nhấp vào nút menu
    Sleep    2s
    Click Element    css=#reset_sidebar_link
    Sleep    5s
  [Teardown]    Close All Browsers

 Test click X
    [Documentation]     Test click X của thanh menu
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    Click Button    css=#react-burger-menu-btn    # Nhấp vào nút menu
    Sleep    2s
    Click Element    css=#react-burger-cross-btn
    Sleep    5s
  [Teardown]    Close All Browsers

 Test click cart
    [Documentation]     Test click cart
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    Click Element    css=#shopping_cart_container    # Nhấp vào nút menu
    Sleep    5s
  [Teardown]    Close All Browsers

Test click shopping_cart_container
    [Documentation]     Test click shopping_cart_container
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    Click Element    css=#shopping_cart_container    # Nhấp vào nút menu
    Sleep    5s
  [Teardown]    Close All Browsers



Test click continue-shopping
    [Documentation]     Test click continue-shopping
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    Click Element    css=#shopping_cart_container 
    Page Should Contain     Your Cart   
    Sleep    2s
    Click Button    css=#continue-shopping   
    Page Should Contain    Products
    Sleep    5s
  [Teardown]    Close All Browsers


Test click back-to-products
    [Documentation]     Test click back-to-products
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    Click Image    css=.inventory_item_img
    Sleep    2s
    Click Button    css=#back-to-products
    Page Should Contain    Products
    Sleep    5s
   [Teardown]    Close All Browsers

Check the title text of all forms present in the web
    [Documentation]    Kiểm tra văn bản tiêu đề của tất cả form có trong web
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    # tiêu đề lớn mặc định
    ${Swag Labs}=     Get Text    //*[@id="header_container"]/div[1]/div[2]/div
    Should Be Equal  ${Swag Labs}  Swag Labs
    # tiêu đề nhỏ của trang tất cả sản phẩm
    ${Products}=     Get Text     //*[@id="header_container"]/div[2]/span
    Should Be Equal  ${Products}  Products
    Go To   https://www.saucedemo.com/cart.html
    # tiêu đề nhỏ của trang giỏ hàng
    ${Your Cart}=     Get Text     //*[@id="header_container"]/div[2]/span
    Should Be Equal  ${Your Cart}  Your Cart
    Go To   https://www.saucedemo.com/checkout-step-one.html
    # tiêu đề nhỏ của trang thông tin giao hàng
    ${Checkout: Your Information}=     Get Text    //*[@id="header_container"]/div[2]/span
    Should Be Equal  ${Checkout: Your Information}  Checkout: Your Information
    Go To   https://www.saucedemo.com/checkout-step-two.html   
    # tiêu đề nhỏ của trang chi tiết mua hàng
    ${Checkout: Overview}=     Get Text     //*[@id="header_container"]/div[2]/span
    Should Be Equal   ${Checkout: Overview}  Checkout: Overview
    Go To   https://www.saucedemo.com/checkout-complete.html 
    # tiêu đề nhỏ của trang thanh toán
    ${Checkout: Complete!}=     Get Text     //*[@id="header_container"]/div[2]/span
    Should Be Equal  ${Checkout: Complete!}  Checkout: Complete!
     [Teardown]    Close All Browsers

Compare Button "Check out" Position
    [Documentation]    So sánh vị trí của button Check out giữa các người dùng
    Login To Website   ${URL}    ${BROWSER}    ${STANDARD_USER_USERNAME}    ${VALID_PASSWORD}
    ${button_position_standard} =   Execute JavaScript    return document.querySelector('.btn_action').getBoundingClientRect();
    Close Browser

    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    ${button_position_performance_glitch} =    Execute JavaScript    return document.querySelector('.btn_action').getBoundingClientRect();
    Close Browser

    Compare Positions     ${button_position_standard}    ${button_position_performance_glitch}
     [Teardown]    Close All Browsers

Compare Button "Add to cart" Position
    [Documentation]    So sánh vị trí của button Add to cart "Test.allTheThings() T-Shirt (Red)" giữa các người dùng
    Login To Website   ${URL}    ${BROWSER}    ${STANDARD_USER_USERNAME}    ${VALID_PASSWORD}
    ${button_position_standard} =   Execute JavaScript    return document.querySelector('.btn_primary').getBoundingClientRect();
    Close Browser

    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    ${button_position_performance_glitch} =    Execute JavaScript    return document.querySelector('.btn_primary').getBoundingClientRect();
    Close Browser

    Compare Positions     ${button_position_standard}    ${button_position_performance_glitch}
   [Teardown]    Close All Browsers

Compare Cart Icon Position
    [Documentation]    So sánh vị trí của biểu tượng giỏ hàng giữa các người dùng
    Login To Website   ${URL}    ${BROWSER}    ${STANDARD_USER_USERNAME}    ${VALID_PASSWORD}
    ${cart_position_standard} =    Execute JavaScript    return document.querySelector('.shopping_cart_container').getBoundingClientRect();
    Close Browser

    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    ${cart_position_visual} =       Execute JavaScript    return document.querySelector('.shopping_cart_container').getBoundingClientRect();
    Close Browser

    Compare Positions    ${cart_position_standard}     ${cart_position_visual}
     [Teardown]    Close All Browsers

*** Keywords ***
Login To Website
    [Arguments]    ${url}    ${browser}    ${username}    ${password}
    Open Browser    ${url}    ${browser}
    Input Text    css=#user-name    ${username}
    Input Password    css=#password    ${password}
    Click Button    css=#login-button

Information default and checkInformation
    [Arguments]    ${expected_first_name}    ${expected_last_name}    ${expected_zip}    ${expected_error}
    Input Text    //*[@id="first-name"]    ${expected_first_name}
    Input Text    //*[@id="last-name"]    ${expected_last_name}
    Input Text    //*[@id="postal-code"]    ${expected_zip}

    # Lấy giá trị đã nhập
    ${first_name_input}    Get Value    //*[@id="first-name"]
    ${last_name_input}    Get Value    //*[@id="last-name"]
    ${zip_input}    Get Value    //*[@id="postal-code"]

    # Kiểm tra giá trị đã nhập có đúng không
    Run Keyword And Continue On Failure    Should Be Equal    ${first_name_input}    ${expected_first_name}
    Run Keyword And Continue On Failure    Should Be Equal    ${last_name_input}    ${expected_last_name}
    Run Keyword And Continue On Failure    Should Be Equal    ${zip_input}    ${expected_zip}

    # Nhấn nút tiếp tục
    Click Button    //*[@id="continue"]

Compare Positions
    [Arguments]    ${position1}    ${position2}
    [Documentation]    So sánh vị trí của hai biểu tượng giỏ hàng và in ra kết quả
    ${x1} =    Convert To Number    ${position1['x']}
    ${y1} =    Convert To Number    ${position1['y']}
    ${x2} =    Convert To Number    ${position2['x']}
    ${y2} =    Convert To Number    ${position2['y']}

    ${diff_x} =    Evaluate    round(abs(${x1} - ${x2}), 2)
    ${diff_y} =    Evaluate    round(abs(${y1} - ${y2}), 2)

    ${acceptable_error} =    Set Variable    0.1  # Ngưỡng chấp nhận được của sai số

    Run Keyword If    ${diff_x} <= ${acceptable_error} and ${diff_y} <= ${acceptable_error}
    ...    Log    Hai biểu tượng giỏ hàng có cùng vị trí
    ...    ELSE    FAIL    Hai biểu tượng giỏ hàng có vị trí khác nhau
#23 tests, 23 passed, 0 faile