*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${BROWSER}             Chrome
${URL}                 https://www.saucedemo.com/
${EXPECTED_URL}        https://www.example.com/dashboard
${VALID_USERNAME}      visual_user
${VALID_PASSWORD}      secret_sauce

${SauceLabsBackpack_ButtonAddtocart_XPATH}    //*[@id="add-to-cart-sauce-labs-backpack"]
${SauceLabsBikeLight_ButtonAddtocart_XPATH}         //*[@id="add-to-cart-sauce-labs-bike-light"]
${SauceLabsOnesie_ButtonAddtocart_XPATH}           //*[@id="add-to-cart-sauce-labs-onesie"]
${SauceLabsBackpack_ButtonButtonName_XPATH}       //*[@id="item_4_title_link"]/div
${ButtonAddtocart_XPATH_detail}        //*[@id="add-to-cart"]
${ButtonRemoveocart_XPATH_detail}        //*[@id="remove"]
${SauceLabsBackpack_ButtonRemove_XPATH}    //*[@id="remove-sauce-labs-backpack"]
${SauceLabsOnesie_ButtonRemove_XPATH}           //*[@id="remove-sauce-labs-onesie"]
${ShoppingCart_Link_CSS}                     //*[@id="shopping_cart_container"]/a
${CartQuantity_CSS}                          //*[@id="shopping_cart_container"]/a/span
${CartItem_XPATH}                            //*[@id="cart_contents_container"]/div/div[1]

${btn_checkout}    //*[@id="checkout"]
${btn_Finish_Checkout_Overview}    //*[@id="finish"]


*** Test Cases ***


*** Test Cases ***

Check whether the text input function in the "first name" field is correct
    [Documentation]    Kiểm tra chức năng nhập văn bản vào trường "first name" có đúng không
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Input Text   //*[@id="first-name"]   Huy
    ${input_value}    Get Value    //*[@id="first-name"]
    Should Be Equal As Strings    ${input_value}    Huy
    [Teardown]    Close All Browsers


Check whether the text input function in the "Last name" field is correct
    [Documentation]    Kiểm tra chức năng nhập văn bản vào trường "Last name" có đúng không
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Input Text    //*[@id="last-name"]    Nguyễn
    ${input_value}    Get Value    //*[@id="last-name"]
    Should Be Equal As Strings    ${input_value}    Nguyễn
    [Teardown]    Close All Browsers

Check whether the text input function in the "postal-code" field is correct
    [Documentation]    Kiểm tra chức năng nhập văn bản vào trường "postal-code" có đúng không
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Input Text    //*[@id="postal-code"]    123
    ${input_value}    Get Value    //*[@id="postal-code"]
    Should Be Equal As Strings    ${input_value}    123
    [Teardown]    Close All Browsers


Check whether the function of entering text into each field in turn is correct
    [Documentation]    Kiểm tra chức năng nhập văn bản lần lượt vào từng trường có đúng không
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Check whether the function of entering text into each field in turn is correct    Huy    Nguyen    1000    ${EMPTY}
    [Teardown]    Close All Browsers


Check the response of the purchase information form with valid information then click "continue" when purchasing any product
    [Documentation]    Kiểm tra phản hồi của form thông tin mua hàng với thông tin hợp lệ sau đó nhấn "continue" khi mua 1 sản phẩm bất kì 
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Information default and checkInformation    Huy    Nguyen    1000    ${EMPTY}
    [Teardown]    Close All Browsers

Check the response of the purchase information form with empty information then click "continue" when purchasing any product
    [Documentation]    Kiểm tra phản hồi của form thông tin mua hàng với thông tin rỗng sau đó nhấn "continue" khi mua 1 sản phẩm bất kì 
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Information default and checkInformation    ${EMPTY}    ${EMPTY}    ${EMPTY}    Error: First Name is required
    [Teardown]    Close All Browsers

Check the response of the purchase information form with empty first name information, then click "continue" when purchasing any product
    [Documentation]    Kiểm tra phản hồi của form thông tin mua hàng với thông tin first name rỗng sau đó nhấn "continue" khi mua 1 sản phẩm bất kì 
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Information default and checkInformation    ${EMPTY}    Nguyen    1000    Error: First Name is required
    [Teardown]    Close All Browsers

Check the response of the purchase information form with empty last name information, then click "continue" when purchasing any product
    [Documentation]   Kiểm tra phản hồi của form thông tin mua hàng với thông tin last name rỗng sau đó nhấn "continue" khi mua 1 sản phẩm bất kì 
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Information default and checkInformation    Huy    ${EMPTY}    1000    Error: Last Name is required
    [Teardown]    Close All Browsers

Check the response of the purchase information form with empty Zip/Postal Code information then click "continue" when purchasing any product
    [Documentation]    Kiểm tra phản hồi của form thông tin mua hàng với thông tin Zip/Postal Code rỗng sau đó nhấn "continue" khi mua 1 sản phẩm bất kì 
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Information default and checkInformation    Huy    Nguyễn    ${EMPTY}    Error: Postal Code is required
    [Teardown]    Close All Browsers

Check the response of the purchase information form with information containing special characters then click "continue" when purchasing any product
    [Documentation]    Kiểm tra phản hồi của form thông tin mua hàng với thông tin chứa kí tự đặt biệt sau đó nhấn "continue" khi mua 1 sản phẩm bất kì 
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Information default and checkInformation    Huy@@    Nguyễn@@    1000@@@    ${EMPTY}
    [Teardown]    Close All Browsers

Check the response of the purchase information form with information containing a large length, then click "continue" when purchasing any product
    [Documentation]    Kiểm tra phản hồi của form thông tin mua hàng với thông tin chứa độ dài lớn sau đó nhấn "continue" khi mua 1 sản phẩm bất kì 
    Add Item To Cart   Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Information default and checkInformation    HuyHuyyyyyyyyyyyyyyyyyyyyyyyyyyy    Nguyễnnnnnnnnnnnnnnnnnnnnnnnn@@    1000@@@    ${EMPTY}
    [Teardown]    Close All Browsers

Check the response of the purchase information form with valid information then click "continue" when purchasing in bulk
    [Documentation]    Kiểm tra phản hồi của form thông tin mua hàng với thông tin hợp lệ sau đó nhấn "continue" khi mua với số lượng lớn 
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Add To Cart    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Click Product Add To Cart    ${SauceLabsBikeLight_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Information default and checkInformation    Huy    Nguyen    1000    ${EMPTY}
    [Teardown]    Close All Browsers

Check the response of the purchase information form with invalid information then click "continue" when purchasing in bulk
    [Documentation]    Kiểm tra phản hồi của form thông tin mua hàng với thông tin không hợp lệ sau đó nhấn "continue" khi mua với số lượng lớn 
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Add To Cart    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Click Product Add To Cart    ${SauceLabsBikeLight_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Information default and checkInformation    Huy    Nguyễn    ${EMPTY}    Error: Postal Code is required
    [Teardown]    Close All Browsers

Check the response of the purchase information form with valid information then click "continue" when you do not purchase any products
    [Documentation]    Kiểm tra phản hồi của form thông tin mua hàng với thông tin hợp lệ sau đó nhấn "continue" khi không mua sản phẩm nào 
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Information default and checkInformation    Huy    Nguyễn    ${EMPTY}    Error: Postal Code is required
    [Teardown]    Close All Browsers

Check if the form retains the entered information after entering all information and click "cancel" then click "checkout" again.
    [Documentation]    Kiểm tra xem form có giữ nguyên thông tin đã nhập sau khi đã nhập đầy đủ thông tin và nhấn "cancel" sau đó nhấn lại "checkout"
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Add To Cart    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Check if the entered information is lost after canceling    Huy    Nguyễn    1000    ${EMPTY}
    [Teardown]    Close All Browsers

Check if the website allows you to return to update the product after going to the checkout page
    [Documentation]    Kiểm tra xem trang web có cho quay lại để cập nhật sản phẩm sau khi đã đi tới trang thanh toán không 
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Add To Cart    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Information default and checkInformation    Huy    Nguyễn    1000    ${EMPTY}
    # Kiểm tra xem có nút "Quay lại" hoặc "Chỉnh sửa" để cập nhật sản phẩm hay không
    Wait Until Element Is Visible   //button[@id="cancel" and @class="btn btn_secondary back btn_medium cart_cancel_link" and @data-test="cancel"]
    ${return_button_existence}    Run Keyword And Return Status    Element Should Be Visible    //button[@id="cancel" and @class="btn btn_secondary back btn_medium cart_cancel_link" and @data-test="cancel"]
    Run Keyword If    '${return_button_existence}'=='True'    Log    Website allows updating the product after filling out all the information
    ...    ELSE    Fail    Website does not allow updating the product after filling out all the information
    Click Button     //button[@id="cancel" and @class="btn btn_secondary back btn_medium cart_cancel_link" and @data-test="cancel"]
    ${redirected}    Run Keyword And Return Status    Element Should Be Visible    //*[@id="contents_wrapper"]
    Should Be True    ${redirected}
    [Teardown]    Close All Browsers

Test Edit Information
    [Documentation]    Kiểm tra tính năng chỉnh sửa thông tin sau khi nhập
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Check the information after editing      ${EMPTY}    Nguyen    1000    Error: First Name is required
    [Teardown]    Close All Browsers

Test the login information deletion feature
    [Documentation]    Kiểm tra tính năng xóa thông tin khi đã nhập
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Check Delete Information   Huy    Nguyen    1000    Error: First Name is required
    [Teardown]    Close All Browsers


Check the feature of deleting information after entering errors with the "X-First name" icon
    [Documentation]    Kiểm tra tính năng xóa thông tin sau khi nhập lỗi bằng icon "X-First name"
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Information default and checkInformation   Huy    ${EMPTY}    1000    Error: Last Name is required
    Sleep   1s
    Click Element    (//*[local-name()='svg'])[1]
    ${first_name_value_after_click}    Get Value    //*[@id="first-name"]
    Run Keyword If    '${first_name_value_after_click}' == ""
    ...    Log     Xóa thành công
    ...    ELSE
    ...    Fail     Xóa thất bại
    [Teardown]    Close All Browsers

Check the feature of deleting information after entering errors with the "X-Last name" icon
    [Documentation]    Kiểm tra tính năng xóa thông tin sau khi nhập lỗi bằng icon "X-Last name"
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Information default and checkInformation   ${EMPTY}   Nhu    1000    Error: First Name is required
    Sleep   1s
    Click Element    (//*[local-name()='svg'])[2]
    ${last_name_value_after_click}    Get Value    //*[@id="last-name"]
    Run Keyword If    '${last_name_value_after_click}' == ""
    ...    Log     Xóa thành công
    ...    ELSE
    ...    Fail     Xóa thất bại
    [Teardown]    Close All Browsers

Check the feature of deleting information after entering errors with the "X-postal-code" icon
    [Documentation]    Kiểm tra tính năng xóa thông tin sau khi nhập lỗi bằng icon "X-postal-code"
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Information default and checkInformation   ${EMPTY}   Nhu    1000    Error: First Name is required
    Sleep   1s
    Click Element    (//*[local-name()='svg'])[3]
    ${postal-code_name_value_after_click}    Get Value    //*[@id="postal-code"]
    Run Keyword If    '${postal-code_name_value_after_click}' == ""
    ...    Log     Xóa thành công
    ...    ELSE
    ...    Fail     Xóa thất bại
    [Teardown]    Close All Browsers

Test the feature to close informative error messages after input errors
    [Documentation]    Kiểm tra tính năng đóng thông báo lỗi thông tin sau khi nhập lỗi
    Add Item To Cart    Sauce Labs Onesie    ${SauceLabsOnesie_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Click Button   //*[@id="continue"]
    Sleep   5s
    Click Button  //*[@id="checkout_info_container"]/div/form/div[1]/div[4]/h3/button
     ${element_visible}    Run Keyword And Return Status    Element Should Not Be Visible    //*[@id="checkout_info_container"]/div/form/div[1]/div[4]/h3/button/svg/path
    Run Keyword If    '${element_visible}' == 'True'
    ...    Log     Đóng thành công
    ...    ELSE
    ...    Fail     Đóng thất bại
    [Teardown]    Close All Browsers

Check Content and Color of SVG Icon
    [Documentation]    Kiểm tra nội dung và màu của icon "X"
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Information default and checkInformation   ${EMPTY}   Nhu    1000    Error: First Name is required
    Sleep   1s
    ${script1} =    Catenate
    ...    var svgElement = document.evaluate('(//*[local-name()="svg"])[1]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    ...    var pathElement = svgElement.querySelector('path');
    ...    var iconColor = window.getComputedStyle(pathElement).getPropertyValue('fill');
    ...    var iconContent = svgElement.getAttribute('data-icon');
    ...    return [iconColor, iconContent];
    ${script2} =    Catenate
    ...    var svgElement = document.evaluate('(//*[local-name()="svg"])[2]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    ...    var pathElement = svgElement.querySelector('path');
    ...    var iconColor = window.getComputedStyle(pathElement).getPropertyValue('fill');
    ...    var iconContent = svgElement.getAttribute('data-icon');
    ...    return [iconColor, iconContent];
    ${script3} =    Catenate
    ...    var svgElement = document.evaluate('(//*[local-name()="svg"])[3]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    ...    var pathElement = svgElement.querySelector('path');
    ...    var iconColor = window.getComputedStyle(pathElement).getPropertyValue('fill');
    ...    var iconContent = svgElement.getAttribute('data-icon');
    ...    return [iconColor, iconContent];
    ${script4} =    Catenate
    ...    var svgElement = document.evaluate('(//*[local-name()="svg"])[4]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    ...    var pathElement = svgElement.querySelector('path');
    ...    var iconColor = window.getComputedStyle(pathElement).getPropertyValue('fill');
    ...    var iconContent = svgElement.getAttribute('data-icon');
    ...    return [iconColor, iconContent];
    Sleep   1s
    ${result1} =    Execute Javascript    ${script1}
    ${result2} =    Execute Javascript    ${script2}
    ${result3} =    Execute Javascript    ${script3}
    ${result4} =    Execute Javascript    ${script4}
    Should Be Equal As Strings    ${result1}[0]    rgb(226, 35, 26)
    Should Be Equal As Strings    ${result2}[0]    rgb(226, 35, 26)
    Should Be Equal As Strings    ${result3}[0]    rgb(226, 35, 26)
    Should Be Equal As Strings    ${result4}[0]    rgb(255, 255, 255)
    Should Be Equal As Strings    ${result1}[1]    times-circle
    Should Be Equal As Strings    ${result2}[1]    times-circle
    Should Be Equal As Strings    ${result3}[1]    times-circle
    Should Be Equal As Strings    ${result4}[1]    times
    [Teardown]    Close All Browsers


Check the text input instructions
    [Documentation]    Kiểm tra văn bản hướng dẫn nhập văn bản
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    ${first_name_placeholder}    Execute Javascript    return document.querySelector('input[placeholder="First Name"]').getAttribute('placeholder')
    ${last_name_placeholder}    Execute Javascript    return document.querySelector('input[placeholder="Last Name"]').getAttribute('placeholder')
    ${postal_code_placeholder}    Execute Javascript    return document.querySelector('input[placeholder="Zip/Postal Code"]').getAttribute('placeholder')
    Run Keyword If    '${first_name_placeholder}' == 'First Name' and '${last_name_placeholder}' == 'Last Name' and '${postal_code_placeholder}' == 'Zip/Postal Code'
    ...    Log     Placeholder texts are correct
    ...    ELSE
    ...    Fail    Placeholder texts are not correct
    [Teardown]    Close All Browsers


Login with Enter Key
    [Documentation]    Kiểm tra xem phím Enter có hoạt động thay thế cho nút đăng nhập không
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Input Text    //*[@id="first-name"]    Như
    Input Text    //*[@id="last-name"]    Nguyễn
    Input Text    //*[@id="postal-code"]    123
    Press Keys    //*[@id="postal-code"]   ENTER 
    Page Should Contain  Checkout: Overview
    [Teardown]    Close All Browsers

Check_Field_Order
    [Documentation]    Kiểm tra xem trường "first-name", "last-name" và "postal-code" có xuất hiện theo thứ tự không
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Wait Until Element Is Visible    id:first-name
    ${first_name}    Get Element Attribute    id:first-name    placeholder
    ${last_name}     Get Element Attribute    id:last-name    placeholder
    ${postal_code}   Get Element Attribute    id:postal-code    placeholder
    Run Keyword If    '${first_name}' == 'First Name' and '${last_name}' == 'Last Name' and '${postal_code}' == 'Zip/Postal Code'
    ...    Log    Các trường first-name, last-name và postal-code xuất hiện theo thứ tự
    ...    ELSE   Fail    Các trường first-name, last-name và postal-code không xuất hiện theo thứ tự
    [Teardown]    Close All Browsers

TestTabOrder 
    [Documentation]    Kiểm tra thứ tự di chuyển trỏ trên màn hình khi nhấn phím Tab 
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Input Text    //*[@id="first-name"]    Như
    Input Text    //*[@id="last-name"]    Nguyễn
    Input Text    //*[@id="postal-code"]    123
    ${first_name_value}=    Get Value    //*[@id="first-name"]
    Press Keys    //*[@id="first-name"]    TAB
    ${last_name_value}=    Get Value    //*[@id="last-name"]
    Press Keys    //*[@id="last-name"]    TAB
    ${postal_code_value}=    Get Value    //*[@id="postal-code"]
    ${expected_first_name_value}=    Set Variable    Như    
    ${expected_last_name_value}=    Set Variable    Nguyễn    
    ${expected_postal_code_value}=    Set Variable    123
    Run Keyword If    '${first_name_value}' == '${expected_first_name_value}' and '${last_name_value}' == '${expected_last_name_value}' and '${postal_code_value}' == '${expected_postal_code_value}'
    ...    Log    Kiểm tra thứ tự con trỏ di chuyển thành công    # Pass nếu thứ tự đúng
    ...    ELSE    Fail    Thứ tự con trỏ di chuyển sai    # Fail nếu thứ tự sai
    [Teardown]    Close All Browsers



Test Shift Tab Order
    [Documentation]    Kiểm tra thứ tự con trỏ di chuyển ngược lại trên màn hình khi nhấn Shift-Tab
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Page Should Contain    Your Cart
    Click Button    ${btn_checkout}
    Input Text    //*[@id="first-name"]    Như
    Input Text    //*[@id="last-name"]    Nguyễn
    Input Text    //*[@id="postal-code"]    123
    ${postal-code_value}=    Get Value    //*[@id="postal-code"]
    Press Keys      //*[@id="postal-code"]  SHIFT+TAB
    ${last_name_value}=    Get Value    //*[@id="last-name"]
    Press Keys      //*[@id="last-name"]  SHIFT+TAB
    ${first_name_value}=    Get Value    //*[@id="first-name"]
    ${expected_first_name_value}=    Set Variable    Như    
    ${expected_last_name_value}=    Set Variable    Nguyễn    
    ${expected_postal-code_value}=    Set Variable    123
    Run Keyword If    '${postal-code_value}' == '${expected_postal-code_value}' and '${last_name_value}' == '${expected_last_name_value}' and '${first_name_value}' == '${expected_first_name_value}'
    ...    Log    Kiểm tra thứ tự con trỏ di chuyển thành công    # Pass nếu thứ tự đúng
    ...    ELSE    Fail    Thứ tự con trỏ di chuyển sai    # Fail nếu thứ tự sai
    [Teardown]    Close All Browsers

*** Keywords ***
Login To Website
    [Arguments]    ${url}    ${browser}    ${username}    ${password}
    Open Browser    ${url}    ${browser}
    Input Text    css=#user-name    ${username}
    Input Password    css=#password    ${password}
    Click Button    css=#login-button

# Thêm 
Add Item To Cart
    [Arguments]    ${product_name}    ${product_xpath}
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains Element    ${product_xpath}    timeout=10s
    Click Element    ${product_xpath}
    Click Element    css=.shopping_cart_link
    ${cart_item_name}=    Get Text    xpath=//div[@class='inventory_item_name']
    Run Keyword If    '${cart_item_name}' == '${product_name}'    Log    Sản phẩm đã được thêm vào giỏ hàng thành công
    ...    ELSE IF    '${cart_item_name}' != ''    Log    Sản phẩm chưa được thêm vào giỏ hàng
    ...    ELSE    Log    Giỏ hàng đang trống
    ...    

Click Product Add To Cart
    [Arguments]    ${locator}
    Click Element    ${locator}
    Log    Product added to cart.

Go To Shopping Cart
    Click Element    ${ShoppingCart_Link_CSS}
    Log    Navigated to shopping cart.

Check Cart Items
    Wait Until Element Is Visible    ${CartItem_XPATH}
    ${cart_items}    Get Text    ${CartItem_XPATH}
    Log    ${cart_items}

Check if the entered information is lost after canceling
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

    # Lưu giá trị các trường dữ liệu trước khi nhấn nút cancel
    ${first_name_before_cancel}    Set Variable    ${first_name_input}
    ${last_name_before_cancel}    Set Variable    ${last_name_input}
    ${zip_before_cancel}    Set Variable    ${zip_input}
    # Nhấn nút cancel
    Click Button    //*[@id="cancel"]
    # sau đó nhấn lại 1 lần nữa nút check out và kiểm tra các trường dữ liệu đã nhập có biến mất hay không
    Click Button    ${btn_checkout}
    # Kiểm tra các trường dữ liệu sau khi nhấn checkout lần thứ 2 với các trường dữ liệu trước đó
    ${first_name_input_after_checkout}    Get Value    //*[@id="first-name"]
    ${last_name_input_after_checkout}    Get Value    //*[@id="last-name"]
    ${zip_input_after_checkout}    Get Value    //*[@id="postal-code"]

    # So sánh các trường dữ liệu sau khi nhấn checkout lần thứ 2 với các trường dữ liệu trước đó
    Run Keyword And Continue On Failure    Run Keyword If    '${first_name_input_after_checkout}'!=''    Should Be Equal    ${first_name_input_after_checkout}    ${first_name_before_cancel}
    Run Keyword And Continue On Failure    Run Keyword If    '${last_name_input_after_checkout}'!=''    Should Be Equal    ${last_name_input_after_checkout}    ${last_name_before_cancel}
    Run Keyword And Continue On Failure    Run Keyword If    '${zip_input_after_checkout}'!=''    Should Be Equal    ${zip_input_after_checkout}    ${zip_before_cancel}

Information default and checkInformation
    [Arguments]    ${expected_first_name}    ${expected_last_name}    ${expected_zip}    ${expected_error}
    Input Text    //*[@id="first-name"]    ${expected_first_name}
    Input Text    //*[@id="last-name"]    ${expected_last_name}
    Input Text    //*[@id="postal-code"]    ${expected_zip}

    # Lấy giá trị đã nhập
    ${first_name_input}    Get Value    //*[@id="first-name"]
    ${last_name_input}    Get Value    //*[@id="last-name"]
    ${zip_input}    Get Value    //*[@id="postal-code"]

    # Nhấn nút tiếp tục
    Click Button    //*[@id="continue"]

    # Chờ để trang web hiển thị thông báo lỗi (nếu có)
    Sleep    2s

    # Kiểm tra nếu có thông báo lỗi xuất hiện thì so sánh với thông báo lỗi mong đợi và kiểm tra xem có chuyển hướng đến form tiếp theo thành công hay không
    ${error_message_visible}    Run Keyword And Return Status    Element Should Be Visible    //div[@class="error-message-container error"]
    Run Keyword If    ${error_message_visible}    Compare Error Message    ${expected_error}
    ...    ELSE    Redirected Successfully

Compare Error Message
    [Arguments]    ${expected_error}
    ${actual_error}    Get Text    //div[@class="error-message-container error"]
    Should Be Equal As Strings    ${actual_error}    ${expected_error}

Redirected Successfully
    ${redirected}    Run Keyword And Return Status    Element Should Be Visible    //*[@id="contents_wrapper"]
    Should Be True    ${redirected}


Click Button And Check Info After Cancel
    [Arguments]    ${btn_checkout}
    # Lấy thông tin đã nhập trước đó
    ${first_name_input}    Get Value    //*[@id="first-name"]
    ${last_name_input}    Get Value    //*[@id="last-name"]
    ${zip_input}    Get Value    //*[@id="postal-code"]
    # Nhấn nút cancel
    Click Button    //*[@id="cancel"]
    # Chờ trang được load
    Sleep    2s
    # Kiểm tra thông tin sau khi cancel
    ${first_name_input_after_cancel}    Get Value    //*[@id="first-name"]
    ${last_name_input_after_cancel}    Get Value    //*[@id="last-name"]
    ${zip_input_after_cancel}    Get Value    //*[@id="postal-code"]
    # So sánh thông tin sau khi cancel với thông tin trước đó
    Run Keyword And Continue On Failure    Should Be Equal    ${first_name_input_after_cancel}    ${first_name_input}
    Run Keyword And Continue On Failure    Should Be Equal    ${last_name_input_after_cancel}    ${last_name_input}
    Run Keyword And Continue On Failure    Should Be Equal    ${zip_input_after_cancel}    ${zip_input}

Check the information after editing
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
    # Lưu thông tin trước khi sửa
    ${old_first_name}    Set Variable    ${first_name_input}
    ${old_last_name}    Set Variable    ${last_name_input}
    ${old_zip}    Set Variable    ${zip_input}
    Sleep     5s
    # Sửa thông tin
    ${new_first_name}    Set Variable    Nhu
    ${new_last_name}    Set Variable    Nuyen
    ${new_zip}    Set Variable    54321
    Input Text    //*[@id="first-name"]    ${new_first_name}
    Input Text    //*[@id="last-name"]    ${new_last_name}
    Input Text    //*[@id="postal-code"]    ${new_zip}
    # Kiểm tra thông tin đã sửa
    ${first_name_input_after_edit}    Get Value    //*[@id="first-name"]
    ${last_name_input_after_edit}    Get Value    //*[@id="last-name"]
    ${zip_input_after_edit}    Get Value    //*[@id="postal-code"]
    Run Keyword And Continue On Failure    Should Be Equal    ${first_name_input_after_edit}    ${new_first_name}
    Run Keyword And Continue On Failure    Should Be Equal    ${last_name_input_after_edit}    ${new_last_name}
    Run Keyword And Continue On Failure    Should Be Equal    ${zip_input_after_edit}    ${new_zip}

Check Delete Information
    [Arguments]    ${expected_first_name}    ${expected_last_name}    ${expected_zip}    ${expected_error}
    Input Text    //*[@id="first-name"]    ${expected_first_name}
    Input Text    //*[@id="last-name"]    ${expected_last_name}
    Input Text    //*[@id="postal-code"]    ${expected_zip}
    Sleep  3s
    # Kiểm tra xóa toàn bộ thông tin
    Clear Element Text    //*[@id="first-name"]
    Clear Element Text    //*[@id="last-name"]
    Clear Element Text    //*[@id="postal-code"]
    # Kiểm tra xem các ô nhập đã được xóa hết chưa
    ${first_name_value}    Get Element Attribute    //*[@id="first-name"]    value
    ${last_name_value}    Get Element Attribute    //*[@id="last-name"]    value
    ${zip_value}    Get Element Attribute    //*[@id="postal-code"]    value
    Run Keyword If    '${first_name_value}' == '' and '${last_name_value}' == '' and '${zip_value}' == ''    Log    Xóa thành công
    ...    ELSE    Log    Xóa không thành công


Check whether the function of entering text into each field in turn is correct
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

