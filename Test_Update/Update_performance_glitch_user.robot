*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           DateTime

*** Variables ***
${BROWSER}             Chrome
${URL}                 https://www.saucedemo.com/
${EXPECTED_URL}        https://www.example.com/dashboard
${VALID_USERNAME}      performance_glitch_user
${VALID_PASSWORD}      secret_sauce
${RESPONSE_THRESHOLD}  1
${performance_issue_message}    Trang web gặp vấn đề về hiệu suất

${SauceLabsBackpack_ButtonAddtocart_XPATH}    //*[@id="add-to-cart-sauce-labs-backpack"]
${SauceLabsBikeLight_ButtonAddtocart_XPATH}         //*[@id="add-to-cart-sauce-labs-bike-light"]
${SauceLabsBoltT-Shirt_ButtonAddtocart_XPATH}      //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
${SauceLabsFleeceJacket_ButtonAddtocart_XPATH}     //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
${SauceLabsOnesie_ButtonAddtocart_XPATH}           //*[@id="add-to-cart-sauce-labs-onesie"]
${Test.allTheThings()T-Shirt(Red)_ButtonAddtocart_XPATH}      //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]

${SauceLabsBackpack_ButtonButtonName_XPATH}       //*[@id="item_4_title_link"]/div
${SauceLabsBikeLight_ButtonButtonName_XPATH}       //*[@id="item_0_title_link"]/div
${SauceLabsBoltT-Shirt_ButtonButtonName_XPATH}     //*[@id="item_1_title_link"]/div
${SauceLabsFleeceJacket_ButtonButtonName_XPATH}     //*[@id="item_5_title_link"]/div
${SauceLabsOnesie_ButtonButtonName_XPATH}          //*[@id="item_2_title_link"]/div        
${Test.allTheThings()T-Shirt(Red)_ButtonButtonName_XPATH}    //*[@id="item_3_title_link"]/div
    
${ButtonAddtocart_XPATH_detail}        //*[@id="add-to-cart"]
${ButtonRemoveocart_XPATH_detail}        //*[@id="remove"]


${SauceLabsBackpack_ButtonRemove_XPATH}    //*[@id="remove-sauce-labs-backpack"]
${SauceLabsBikeLight_ButtonRemove_XPATH}         //*[@id="remove-sauce-labs-bike-light"]
${SauceLabsBoltT-Shirt_ButtonRemove_XPATH}      //*[@id="remove-sauce-labs-bolt-t-shirt"]
${SauceLabsFleeceJacket_ButtonRemove_XPATH}     //*[@id="remove-sauce-labs-fleece-jacket"]
${SauceLabsOnesie_ButtonRemove_XPATH}           //*[@id="remove-sauce-labs-onesie"]
${Test.allTheThings()T-Shirt(Red)_ButtonRemove_XPATH}      //*[@id="remove-test.allthethings()-t-shirt-(red)"]

${ShoppingCart_Link_CSS}                     //*[@id="shopping_cart_container"]/a
${CartQuantity_CSS}                          //*[@id="shopping_cart_container"]/a/span
${CartItem_XPATH}                            //*[@id="cart_contents_container"]/div/div[1]
${EXPECTED_ERROR_MESSAGE}    Epic sadface: Username and password do not match any user in this service

*** Test Cases ***
# Thêm sản phẩm vào giỏ hàng 
# Thêm một sản phẩm vào giỏ hàng với số lượng là 1.
Add one item to the cart with a quantity of 1 using the SauceLabsBackpack product and performance testing
    [Documentation]    "Thêm một sản phẩm vào giỏ hàng với số lượng là 1 bằng - sản phẩm SauceLabsBackpack và kiểm tra hiệu suất "
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser

Add one item to the cart with a quantity of 1 using the SauceLabsBikeLight product and performance testing
    [Documentation]    "Thêm một sản phẩm vào giỏ hàng với số lượng là 1 bằng - sản phẩm SauceLabsBikeLight và kiểm tra hiệu suất "
    Add Item To Cart    Sauce Labs Bike Light    ${SauceLabsBikeLight_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser


Add one item to the cart with a quantity of 1 using the SauceLabsBoltT-Shirt product and performance testing
    [Documentation]    "Thêm một sản phẩm vào giỏ hàng với số lượng là 1 bằng - sản phẩm SauceLabsBoltT-Shirt và kiểm tra hiệu suất "
    Add Item To Cart   Sauce Labs BoltT-Shirt   ${SauceLabsBoltT-Shirt_ButtonAddtocart_XPATH} 
    Go To Shopping Cart
    Check Cart Items
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser

    
Add one item to the cart with a quantity of 1 using the SauceLabsFleeceJacket product and performance testing
    [Documentation]    "Thêm một sản phẩm vào giỏ hàng với số lượng là 1 bằng - sản phẩm SauceLabsFleeceJacket và kiểm tra hiệu suất "
    Add Item To Cart   Sauce Labs Fleece Jacket   ${SauceLabsFleeceJacket_ButtonAddtocart_XPATH} 
    Go To Shopping Cart
    Check Cart Items
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser

Add one item to the cart with a quantity of 1 using the SauceLabsOnesie product and performance testing
    [Documentation]    "Thêm một sản phẩm vào giỏ hàng với số lượng là 1 bằng - sản phẩm SauceLabsOnesie và kiểm tra hiệu suất "
    Add Item To Cart   Sauce Labs Onesie   ${SauceLabsOnesie_ButtonAddtocart_XPATH}   
    Go To Shopping Cart
    Check Cart Items
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser

Add one item to the cart with a quantity of 1 using the Test.allTheThings()T-Shirt(Red) product and performance testing
    [Documentation]    "Thêm một sản phẩm vào giỏ hàng với số lượng là 1 bằng - sản phẩm Test.allTheThings()T-Shirt(Red) và kiểm tra hiệu suất "
    Add Item To Cart   Test.allTheThings() T-Shirt(Red)  ${Test.allTheThings()T-Shirt(Red)_ButtonAddtocart_XPATH}
    Go To Shopping Cart
    Check Cart Items
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser


# Thêm một sản phẩm vào giỏ hàng với số lượng là 1 từ trang chi tiết sp
Add one item to the cart with a quantity of 1 using the SauceLabsBackpack product from the product detail page and performance testing
    [Documentation]    "Thêm một sản phẩm vào giỏ hàng với số lượng là 1 bằng - sản phẩm SauceLabsBackpack từ trang ctsp và kiểm tra hiệu suất "
    Add Item To Cart from the product detail page    Sauce Labs Backpack  ${SauceLabsBackpack_ButtonButtonName_XPATH}   ${ButtonAddtocart_XPATH_detail} 
    Go To Shopping Cart
    Check Cart Items
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser


Add one item to the cart with a quantity of 1 using the SauceLabsBikeLight product from the product detail page and performance testing
    [Documentation]    "Thêm một sản phẩm vào giỏ hàng với số lượng là 1 bằng - sản phẩm SauceLabsBikeLight từ trang ctsp và kiểm tra hiệu suất "
    Add Item To Cart from the product detail page    Sauce Labs Bike Light    ${SauceLabsBikeLight_ButtonButtonName_XPATH}     ${ButtonAddtocart_XPATH_detail} 
    Go To Shopping Cart
    Check Cart Items
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser


Add one item to the cart with a quantity of 1 using the SauceLabsBoltT-Shirt product from the product detail page and performance testing
    [Documentation]    "Thêm một sản phẩm vào giỏ hàng với số lượng là 1 bằng - sản phẩm SauceLabsBoltT-Shirt từ trang ctsp và kiểm tra hiệu suất "
    Add Item To Cart from the product detail page  Sauce Labs BoltT-Shirt   ${SauceLabsBoltT-Shirt_ButtonButtonName_XPATH}     ${ButtonAddtocart_XPATH_detail} 
    Go To Shopping Cart
    Check Cart Items
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser

    
Add one item to the cart with a quantity of 1 using the SauceLabsFleeceJacket product from the product detail page and performance testing
    [Documentation]    "Thêm một sản phẩm vào giỏ hàng với số lượng là 1 bằng - sản phẩm SauceLabsFleeceJacket từ trang ctsp và kiểm tra hiệu suất "
    Add Item To Cart from the product detail page  Sauce Labs Fleece Jacket   ${SauceLabsFleeceJacket_ButtonButtonName_XPATH}     ${ButtonAddtocart_XPATH_detail} 
    Go To Shopping Cart
    Check Cart Items
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser


Add one item to the cart with a quantity of 1 using the SauceLabsOnesie product from the product detail page and performance testing
    [Documentation]    "Thêm một sản phẩm vào giỏ hàng với số lượng là 1 bằng - sản phẩm SauceLabsOnesie từ trang ctsp và kiểm tra hiệu suất "
    Add Item To Cart from the product detail page  Sauce Labs Onesie   ${SauceLabsOnesie_ButtonButtonName_XPATH}       ${ButtonAddtocart_XPATH_detail}  
    Go To Shopping Cart
    Check Cart Items
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser


Add one item to the cart with a quantity of 1 using the Test.allTheThings()T-Shirt(Red) product from the product detail page and performance testing
    [Documentation]    "Thêm một sản phẩm vào giỏ hàng với số lượng là 1 bằng - sản phẩm Test.allTheThings()T-Shirt(Red) từ trang ctsp và kiểm tra hiệu suất "
    Add Item To Cart from the product detail page  Test.allTheThings() T-Shirt(Red)   ${Test.allTheThings()T-Shirt(Red)_ButtonButtonName_XPATH}    ${ButtonAddtocart_XPATH_detail} 
    Go To Shopping Cart
    Check Cart Items
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser



#Thêm sản phẩm vào giỏ hàng sau đó thoát khỏi trang web , và đăng nhập lại kiểm tra xem nội dung giỏ hàng có đúng với ban đầu không
Add Products To Cart And Verify After Logout And Login and performance testing
    [Documentation]    Thêm sản phẩm vào giỏ hàng sau đó thoát khỏi trang web , và đăng nhập lại kiểm tra xem nội dung giỏ hàng có đúng với ban đầu không và kiểm tra hiệu suất 
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    ${added_items}    Create List    # Tạo một danh sách để lưu trữ các sản phẩm đã thêm
    Click Product Add To Cart    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Log    Đã thêm sản phẩm đầu tiên vào giỏ hàng
    Append To List    ${added_items}    Sauce Labs Backpack   # Thêm sản phẩm vào danh sách
    Click Product Add To Cart    ${SauceLabsBikeLight_ButtonAddtocart_XPATH}
    Log    Đã thêm sản phẩm thứ hai vào giỏ hàng
    Append To List    ${added_items}    Sauce Labs Bike Light   # Thêm sản phẩm vào danh sách
    ${cart_quantity_before}    Get Text    ${CartQuantity_CSS}
    Should Be Equal As Numbers    ${cart_quantity_before}    2    # Kiểm tra số lượng sản phẩm trong giỏ hàng
    # Lưu trữ nội dung giỏ hàng trước khi thoát
    Sleep   15s
    Go To Shopping Cart
    ${cart_items_before}    Get Text    ${CartItem_XPATH}
    Sleep   15s
    ${start_time}=    Get Time    epoch
    Click Element   //*[@id="react-burger-menu-btn"]
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep   5s
    ${start_time}=    Get Time    epoch
    Click Element  //*[@id="logout_sidebar_link"]
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Input Text    css=#user-name    ${VALID_USERNAME}
    Input Password    css=#password    ${VALID_PASSWORD} 
    Click Button    css=#login-button
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Should Be Equal As Numbers    ${cart_quantity_before}    2 
    Go To Shopping Cart
    Wait Until Element Is Visible    ${CartItem_XPATH}
    # Kiểm tra nội dung giỏ hàng sau khi đăng nhập lại
    ${cart_items_after}    Get Text    ${CartItem_XPATH}
    Should Be Equal    ${cart_items_before}    ${cart_items_after}    Message=Giỏ hàng không thay đổi sau khi đăng nhập lại
    Log Many    Nội dung giỏ hàng sau khi đăng nhập lại: ${cart_items_after}
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser


    

# Thêm một sản phẩm vào giỏ hàng với số lượng lớn hơn 1.
Add a product to the cart with a quantity greater than 1 and performance testing
    [Documentation]    Cập nhật giỏ hàng - thêm 2 sản phẩm cùng 1 lúc
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    ${added_items}    Create List   # Tạo một danh sách để lưu trữ các sản phẩm đã thêm
    Click Product Add To Cart    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Log    Đã thêm sản phẩm đầu tiên vào giỏ hàng
    Append To List    ${added_items}    Sauce Labs Backpack   # Thêm sản phẩm vào danh sách
    Click Product Add To Cart    ${SauceLabsBikeLight_ButtonAddtocart_XPATH}
    Log    Đã thêm sản phẩm thứ hai vào giỏ hàng
    Append To List    ${added_items}    Sauce Labs Bike Light   # Thêm sản phẩm vào danh sách
    ${cart_quantity_before}    Get Text    ${CartQuantity_CSS}
    Should Be Equal As Numbers    ${cart_quantity_before}    2    # Kiểm tra số lượng sản phẩm trong giỏ hàng
    Log    Số lượng sản phẩm trước khi thêm: ${cart_quantity_before}
    Go To Shopping Cart
    Wait Until Element Is Visible    ${CartItem_XPATH}
    ${cart_items}    Get Text    ${CartItem_XPATH}
    Log    ${cart_items}
    Log Many    Added items to cart: ${added_items}
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser

# Thêm một sản phẩm vào giỏ hàng với số lượng lớn hơn 1 từ trang chi tiết sản phẩm
Add a product to the cart with a quantity greater than 1 from the product detail page and performance testing
    [Documentation]    Cập nhật giỏ hàng - thêm 2 sản phẩm cùng 1 lúc từ chi tiết sản phẩm và kiểm tra hiệu suất 
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    ${added_items}    Create List   # Tạo một danh sách để lưu trữ các sản phẩm đã thêm
    Click Product Add To Cart from product details page   ${SauceLabsBackpack_ButtonButtonName_XPATH}   ${ButtonAddtocart_XPATH_detail} 
    Log    Đã thêm sản phẩm đầu tiên vào giỏ hàng
    Append To List    ${added_items}    Sauce Labs Backpack   # Thêm sản phẩm vào danh sách
    Click Element     //*[@id="back-to-products"]
    Click Product Add To Cart from product details page   ${SauceLabsBikeLight_ButtonButtonName_XPATH}   ${ButtonAddtocart_XPATH_detail} 
    Log    Đã thêm sản phẩm thứ hai vào giỏ hàng
    Append To List    ${added_items}    Sauce Labs Bike Light   # Thêm sản phẩm vào danh sách
    ${cart_quantity_before}    Get Text    ${CartQuantity_CSS}
    Should Be Equal As Numbers    ${cart_quantity_before}    2    # Kiểm tra số lượng sản phẩm trong giỏ hàng
    Log    Số lượng sản phẩm trước khi thêm: ${cart_quantity_before}
    Go To Shopping Cart
    Wait Until Element Is Visible    ${CartItem_XPATH}
    ${cart_items}    Get Text    ${CartItem_XPATH}
    Log    ${cart_items}
    Log Many    Added items to cart: ${added_items}
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser


# Thêm sản phẩm đã có trong giỏ hàng.
Add product already in cart and performance testing
    [Documentation]    Kiểm tra hành vi thêm sản phẩm đã có trong giỏ hàng và kiểm tra hiệu suất 
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    Log    Chờ cho đến khi đường dẫn giỏ hàng xuất hiện
    ${start_time}=    Get Time    epoch
    Click Element    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s 
    Log    Đã nhấn nút thêm sản phẩm vào giỏ hàng
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    Log    Chờ cho đến khi đường dẫn giỏ hàng xuất hiện
    ${start_time}=    Get Time    epoch
    Click Element     //*[@id="continue-shopping"]
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s 
    ${start_time}=    Get Time    epoch
    Click Element    ${SauceLabsBackpack_ButtonAddtocart_XPATH}   
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s 
    Log    Đã nhấn nút thêm sản phẩm vào giỏ hàng lần thứ hai
    ${error_message}    Run Keyword And Return Status    Handle Possible Error
    Run Keyword If    ${error_message}    Log    Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng: ${EXPECTED_ERROR_MESSAGE}
    ...    ELSE    Log    Sản phẩm đã được thêm vào giỏ hàng một lần nữa
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser

# Thêm sản phẩm đã có trong giỏ hàng từ chi tiết sp
Add product already in cart from the product detail page and performance testing
    [Documentation]    Kiểm tra hành vi thêm sản phẩm đã có trong giỏ hàng từ trang ctsp và kiểm tra hiệu suất 
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    Log    Chờ cho đến khi đường dẫn giỏ hàng xuất hiện
    ${start_time}=    Get Time    epoch
    Click Element    ${SauceLabsBackpack_ButtonButtonName_XPATH} 
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s 
    ${start_time}=    Get Time    epoch
    Click Element    ${ButtonAddtocart_XPATH_detail}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s 
    ${start_time}=    Get Time    epoch
    Click Element     //*[@id="back-to-products"]
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s 
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    ${start_time}=    Get Time    epoch
    Click Element    ${SauceLabsBackpack_ButtonButtonName_XPATH} 
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s 
    ${start_time}=    Get Time    epoch
    Click Element    ${ButtonAddtocart_XPATH_detail}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s 
    Log    Đã nhấn nút thêm sản phẩm vào giỏ hàng lần thứ hai
    ${error_message}    Run Keyword And Return Status    Handle Possible Error
    Run Keyword If    ${error_message}    Log    Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng: ${EXPECTED_ERROR_MESSAGE}
    ...    ELSE    Log    Sản phẩm đã được thêm vào giỏ hàng một lần nữa
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser


# thêm nhiều sản phẩm khác nhau với số lượng đối với mỗi sản phẩm là 1
Add multiple different products with a quantity of 1 for each product and performance testing
    [Documentation]    Cập nhật giỏ hàng - thêm nhiều sản phẩm khác nhau cùng 1 lúc với số lượng đối với mỗi sản phẩm là 1 và kiểm tra hiệu suất 
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    ${added_items}    Create List 
    Click Product Add To Cart    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Append To List    ${added_items}    Sauce Labs Backpack
    Log    Đã thêm sản phẩm Sauce Labs Backpack vào giỏ hàng
    Click Product Add To Cart    ${SauceLabsBikeLight_ButtonAddtocart_XPATH}
    Append To List    ${added_items}    Sauce Labs Bike Light
    Log    Đã thêm sản phẩm Sauce Labs Bike Light vào giỏ hàng
    Click Product Add To Cart    ${SauceLabsFleeceJacket_ButtonAddtocart_XPATH} 
    Append To List    ${added_items}   Sauce Labs Fleece Jacket
    Log    Đã thêm sản phẩm Sauce Labs Fleece Jacket vào giỏ hàng
    Click Product Add To Cart    ${Test.allTheThings()T-Shirt(Red)_ButtonAddtocart_XPATH} 
    Append To List    ${added_items}   Test.allTheThings()T-Shirt(Red)
    Log    Đã thêm sản phẩm Test.allTheThings()T-Shirt(Red) vào giỏ hàng
    Click Product Add To Cart    ${SauceLabsBoltT-Shirt_ButtonAddtocart_XPATH}  
    Append To List    ${added_items}   Labs Bolt T-Shirt
    Log    Đã thêm sản phẩm Sauce Labs Bolt T-Shirt vào giỏ hàng
    Check Cart Quantity    5
    Go To Shopping Cart
    Check Cart Items
    Log Many    Added items to cart: ${added_items}
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser

# thêm nhiều sản phẩm khác nhau với số lượng đối với mỗi sản phẩm là 1 từ trang ctsp
Add multiple different products with a quantity of 1 for each product from the product detail page and performance testing
    [Documentation]    Cập nhật giỏ hàng - thêm nhiều sản phẩm khác nhau cùng 1 lúc với số lượng đối với mỗi sản phẩm là 1  từ trang ctsp và kiểm tra hiệu suất 
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    ${added_items}    Create List 
    Click Product Add To Cart from product details page   ${SauceLabsBackpack_ButtonButtonName_XPATH}   ${ButtonAddtocart_XPATH_detail} 
    Append To List    ${added_items}    Sauce Labs Backpack
    Log    Đã thêm sản phẩm Sauce Labs Backpack vào giỏ hàng
    Click Element     //*[@id="back-to-products"]
    Click Product Add To Cart from product details page   ${SauceLabsBikeLight_ButtonButtonName_XPATH}   ${ButtonAddtocart_XPATH_detail} 
    Append To List    ${added_items}    Sauce Labs Bike Light
    Log    Đã thêm sản phẩm Sauce Labs Bike Light vào giỏ hàng
    Click Element     //*[@id="back-to-products"]
    Click Product Add To Cart from product details page   ${SauceLabsFleeceJacket_ButtonButtonName_XPATH}   ${ButtonAddtocart_XPATH_detail} 
    Append To List    ${added_items}   Sauce Labs Fleece Jacket
    Log    Đã thêm sản phẩm Sauce Labs Fleece Jacket vào giỏ hàng
    Click Element     //*[@id="back-to-products"]
    Click Product Add To Cart from product details page   ${Test.allTheThings()T-Shirt(Red)_ButtonButtonName_XPATH}   ${ButtonAddtocart_XPATH_detail} 
    Append To List    ${added_items}   Test.allTheThings()T-Shirt(Red)
    Log    Đã thêm sản phẩm Test.allTheThings()T-Shirt(Red) vào giỏ hàng
    Click Element     //*[@id="back-to-products"]
    Click Product Add To Cart from product details page   ${SauceLabsBoltT-Shirt_ButtonButtonName_XPATH}   ${ButtonAddtocart_XPATH_detail} 
    Append To List    ${added_items}   Labs Bolt T-Shirt
    Log    Đã thêm sản phẩm Sauce Labs Bolt T-Shirt vào giỏ hàng
    Check Cart Quantity    5
    Go To Shopping Cart
    Check Cart Items     
    Log Many    Added items to cart: ${added_items}
    Run Keyword And Ignore Error    Close Browser


# thêm nhiều sản phẩm khác nhau với số lượng đối với mỗi sản phẩm nhiều hơn 1
Add multiple different products with varying quantities for each product and performance testing
    [Documentation]    Cập nhật giỏ hàng - thêm nhiều sản phẩm khác nhau với số lượng đối với mỗi sản phẩm là nhiều hơn 1 và kiểm tra hiệu suất 
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Add Product With Quantity    Sauce Labs Backpack    2    # Thêm sản phẩm đầu tiên với số lượng 2
    Add Product With Quantity    Sauce Labs Bike Light    9    # Thêm sản phẩm thứ hai với số lượng 9
    Add Product With Quantity    Sauce Labs Fleece Jacket    4    # Thêm sản phẩm thứ ba với số lượng 4
    Add Product With Quantity    Test.allTheThings()T-Shirt(Red)    6    # Thêm sản phẩm thứ tư với số lượng 6
    Go To Shopping Cart
    Check Cart Items
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser

# Xóa sản phẩm 
Delete_product_after_adding_and_check_cart_quantity and performance testing
    [Documentation]  Xóa 1 sản phẩm sau khi thêm 1 sản phẩm và kiểm tra số lượng sản phẩm trên giỏ hàng và kiểm tra hiệu suất 
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    ${product_name}    Get Text    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    ${start_time}=    Get Time    epoch
    Click Element   ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Log    Sản phẩm "Sauce Labs Backpack" đã được thêm vào giỏ hàng
    Wait Until Page Contains Element    ${SauceLabsBackpack_ButtonRemove_XPATH}
    ${cart_quantity_before_remove}    Get Text    ${CartQuantity_CSS}
    Log    Số lượng sản phẩm trên giỏ hàng sau khi thêm: ${cart_quantity_before_remove}
    ${start_time}=    Get Time    epoch
    Click Element   ${SauceLabsBackpack_ButtonRemove_XPATH}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s 
    Log    Sản phẩm "Sauce Labs Backpack" đã được xóa khỏi giỏ hàng
    Element Should Not Be Visible    ${CartQuantity_CSS}
    ...    not found
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser

Delete_a_product_after_adding_multiple_products_and_check_cart_quantity and performance testing
    [Documentation]   xóa một sản phẩm sau khi thêm nhiều sản phẩm và kiểm tra số lượng sản phẩm trên giỏ hàng và kiểm tra hiệu suất 
    # Bước 1: Khai báo danh sách các xpath của sản phẩm
    @{product_xpath_list}=  Create List  ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    ...  ${SauceLabsBikeLight_ButtonAddtocart_XPATH}
    ...   ${SauceLabsOnesie_ButtonAddtocart_XPATH}   
    # Bước 2: Thêm nhiều sản phẩm và xóa một sản phẩm sau khi thêm
    Add Multiple Products And Remove One  ${product_xpath_list}
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser


Delete_Multiple_Products_After_Adding_And_Check_Cart_Quantity and performance testing
    [Documentation]  Xóa nhiều sản phẩm sau khi thêm và kiểm tra số lượng trên giỏ hàng và kiểm tra hiệu suất 
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    # Thêm 3 sản phẩm vào giỏ hàng
    ${start_time}=    Get Time    epoch
    Click Element    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    ${start_time}=    Get Time    epoch
    Click Element    ${SauceLabsBikeLight_ButtonAddtocart_XPATH}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    ${start_time}=    Get Time    epoch
    Click Element    ${SauceLabsOnesie_ButtonAddtocart_XPATH}  
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s 
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    # Kiểm tra số lượng trước khi xóa sản phẩm
    ${cart_quantity_before_remove}    Get Text    ${CartQuantity_CSS}
    Log    Số lượng trong giỏ hàng trước khi xóa: ${cart_quantity_before_remove}
    # Xóa 2 sản phẩm từ giỏ hàng
    ${start_time}=    Get Time    epoch
    Click Element   ${SauceLabsBackpack_ButtonRemove_XPATH} 
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    ${start_time}=    Get Time    epoch
    Click Element   ${SauceLabsBikeLight_ButtonRemove_XPATH}
        ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s 
    # Kiểm tra số lượng sau khi xóa sản phẩm
    ${cart_quantity_after_remove}    Get Text    ${CartQuantity_CSS}
    Run Keyword If    '${cart_quantity_before_remove}' != '${cart_quantity_after_remove}'
    ...    Log     Xóa thành công 
    ...    ELSE
    ...    FAIL    Xóa không thành công 
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser




Check_behavior_when_user_try_to_delete_product_from_empty_cart and performance testing
    [Documentation]  Kiểm tra hành vi khi người dùng cố gắng xóa một sản phẩm khi giỏ hàng đang trống và kiểm tra hiệu suất 
    # Bước 1: Mở trang web
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    # Bước 2: Kiểm tra xem giỏ hàng có trống hay không
    ${is_cart_empty}    Run Keyword And Return Status    Element Should Not Be Visible    ${CartQuantity_CSS}
    Run Keyword If    ${is_cart_empty}
    ...    Log    Giỏ hàng đang trống    
    ...    ELSE    
    ...    Log    Giỏ hàng không trống
    # Bước 3: Thực hiện xóa sản phẩm khỏi giỏ hàng và kiểm tra thông báo
    ${start_time}=    Get Time    epoch
    Click Element    ${ShoppingCart_Link_CSS}   # Mở giỏ hàng
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${CartItem_XPATH}   # Chờ cho giỏ hàng được load
    ${cart_items}    Get Text    ${CartItem_XPATH}   # Lấy tất cả các sản phẩm trong giỏ hàng
    Run Keyword If    '${cart_items}' != ''
    ...    Log    Xóa không thành công
    ...    ELSE
    ...    FAIL   Xóa thành công
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser



Check_Delete_Product_From_Cart_After_Adding_One_Item and performance testing
    [Documentation]  Kiểm tra xóa một sản phẩm trong giỏ hàng sau khi thêm 1 sản phẩm và kiểm tra nội dung trong giỏ hàng và kiểm tra hiệu suất 
    Add Item To Cart    Sauce Labs Backpack    ${SauceLabsBackpack_ButtonAddtocart_XPATH}   
    Log    Đã thêm sản phẩm "Sauce Labs Backpack" vào giỏ hàng 
    #Kiểm tra số lượng sản phẩm trong giỏ hàng
    ${cart_quantity_before}    Get Text    ${CartQuantity_CSS}
    Run Keyword If    '${cart_quantity_before}' == 'not found'
    ...    Log    Giỏ hàng đang trống
    ...    ELSE
    ...    Log    Số lượng sản phẩm trong giỏ hàng: ${cart_quantity_before}
    Go To Shopping Cart
    Log    Đã mở giỏ hàng
    Remove Recently Added Product
    Log    Đã xóa một sản phẩm khỏi giỏ hàng
    # Kiểm tra số lượng sản phẩm trên ${CartQuantity_CSS}
    Element Should Not Be Visible    ${CartQuantity_CSS}
    ...    not found
    Log    Số lượng sản phẩm trên giỏ hàng không còn hiển thị - Sản phẩm đã bị xóa khỏi giỏ hàng thành công
    #Kiểm tra số lượng và nội dung trong ${CartItem_XPATH}
    Check Cart Items
    Log    Đã kiểm tra nội dung trong giỏ hàng
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser

Delete_Product_After_Adding_Multiple_Items_And_Check_Cart_Quantity and performance testing
    [Documentation]  Kiểm tra xóa một sản phẩm trong giỏ hàng sau khi thêm nhiều sản phẩm và kiểm tra nội dung trong giỏ hàng và kiểm tra hiệu suất 
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    #Thêm nhiều sản phẩm vào giỏ hàng
    ${start_time}=    Get Time    epoch
    Click Element    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    Log    Đã thêm sản phẩm "Sauce Labs Backpack" vào giỏ hàng
    ${start_time}=    Get Time    epoch
    Click Element    ${SauceLabsBikeLight_ButtonAddtocart_XPATH}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    Log    Đã thêm sản phẩm "Sauce Labs Bike Light" vào giỏ hàng
    ${start_time}=    Get Time    epoch
    Click Element    ${SauceLabsBoltT-Shirt_ButtonAddtocart_XPATH}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    Log    Đã thêm sản phẩm "Sauce Labs Bolt T-Shirt" vào giỏ hàng
    # Kiểm tra số lượng trên giỏ hàng và vào giỏ hàng kiếm tra số lượng và nội dung trong giỏ hàng trước khi xóa sản phẩm
    ${cart_quantity_before_remove}    Get Text    ${CartQuantity_CSS}
    Log    Số lượng trong giỏ hàng trước khi xóa: ${cart_quantity_before_remove}
    Go To Shopping Cart
    Log    Đã mở giỏ hàng
    Check Cart Items
    Log    Đã kiểm tra nội dung trong giỏ hàng
    # Quay lại trang trước
    Go Back
    Log    Quay lại trang mua hàng (trang trước)
    # Quay lại trang giỏ hàng 1 lần nữa để tiến hành xóa sản phẩm và kiểm tra
    Go To Shopping Cart
    Log    Đã mở giỏ hàng
    Remove Recently Added Product 
    Log    Đã xóa một sản phẩm khỏi giỏ hàng
    Check Cart Items
    Log    Đã kiểm tra nội dung trong giỏ hàng
    ${cart_quantity_after_remove}    Get Text    ${CartQuantity_CSS}
    Run Keyword If    '${cart_quantity_before_remove}' != '${cart_quantity_after_remove}'
    ...    Log    Xóa thành công 
    ...    ELSE
    ...    Fail     Xóa không thành công
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser

Delete multiple products after adding multiple products and check the content in the cart and performance testing
    [Documentation]  Xóa nhiều sản phẩm sau khi thêm nhiều sản phẩm và kiểm tra nội dung trong giỏ hàng và kiểm tra hiệu suất 
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    # Thêm 3 sản phẩm vào giỏ hàng
    ${start_time}=    Get Time    epoch
    Click Element    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    ${start_time}=    Get Time    epoc
    Click Element    ${SauceLabsBikeLight_ButtonAddtocart_XPATH}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    ${start_time}=    Get Time    epoc
    Click Element    ${SauceLabsOnesie_ButtonAddtocart_XPATH}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s   
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    # Kiểm tra số lượng trước khi xóa sản phẩm
    ${cart_quantity_before_remove}    Get Text    ${CartQuantity_CSS}
    Log    Số lượng trong giỏ hàng trước khi xóa: ${cart_quantity_before_remove}
    Go To Shopping Cart
    Log    Đã mở giỏ hàng
    Check Cart Items
    Log    Đã kiểm tra nội dung trong giỏ hàng
    ${start_time}=    Get Time    epoch
    # Quay lại trang trước
    Click Element   //*[@id="continue-shopping"]
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    # Quay lại trang giỏ hàng 1 lần nữa để tiến hành xóa sản phẩm và kiểm tra
    Go To Shopping Cart
    Log    Đã mở giỏ hàng
    Remove many Recently Added Product 
    Log    Đã xóa nhiều sản phẩm khỏi giỏ hàng
    Check Cart Items
    Log    Đã kiểm tra nội dung trong giỏ hàng
    ${cart_quantity_after_remove}    Get Text    ${CartQuantity_CSS}
    Run Keyword If    '${cart_quantity_before_remove}' != '${cart_quantity_after_remove}'
    ...    Log    Xóa thành công 
    ...    ELSE
    ...    Fail     Xóa không thành công
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    Run Keyword And Ignore Error    Close Browser

Delete_product_after_adding_and_check_cart_quantity_from ctsp and performance testing
    [Documentation]  Xóa 1 sản phẩm sau khi thêm 1 sản phẩm và kiểm tra số lượng sản phẩm trên giỏ hàng từ trang ctsp và kiểm tra hiệu suất 
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    ${product_name}    Get Text    ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    Click Product Add To Cart from product details page   ${SauceLabsBackpack_ButtonButtonName_XPATH}   ${ButtonAddtocart_XPATH_detail} 
    Log    Sản phẩm "Sauce Labs Backpack" đã được thêm vào giỏ hàng
    ${cart_quantity_before_remove}    Get Text    ${CartQuantity_CSS}
    Log    Số lượng sản phẩm trên giỏ hàng sau khi thêm: ${cart_quantity_before_remove}
    Sleep   3s
    Click Element   ${ButtonRemoveocart_XPATH_detail}
    Log    Sản phẩm "Sauce Labs Backpack" đã được xóa khỏi giỏ hàng
    Element Should Not Be Visible    ${CartQuantity_CSS}
    ...    not found
    Log    Số lượng sản phẩm trên giỏ hàng không còn hiển thị - Sản phẩm đã bị xóa khỏi giỏ hàng thành công
    Run Keyword And Ignore Error    Close Browser

Delete_a_product_after_adding_multiple_products_and_check_cart_quantity_from ctsp and performance testing
    [Documentation]   xóa một sản phẩm sau khi thêm nhiều sản phẩm và kiểm tra số lượng sản phẩm trên giỏ hàng từ trang ctsp và kiểm tra hiệu suất 
    # Bước 1: Khai báo danh sách các xpath của sản phẩm
    @{product_xpath_list}=  Create List  ${SauceLabsBackpack_ButtonAddtocart_XPATH}
    ...  ${SauceLabsBikeLight_ButtonAddtocart_XPATH}
    ...   ${SauceLabsOnesie_ButtonAddtocart_XPATH}   
    # Bước 2: Thêm nhiều sản phẩm và xóa một sản phẩm sau khi thêm
    Add_Multiple_Products_And_Remove_One_fromctsp   ${product_xpath_list}
    Run Keyword And Ignore Error    Close Browser


Delete_Multiple_Products_After_Adding_And_Check_Cart_Quantity_from ctsp and performance testing
    [Documentation]  Xóa nhiều sản phẩm sau khi thêm nhiều sp từ trang ctsp và kiểm tra hiệu suất 
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    # Thêm 3 sản phẩm vào giỏ hàng
    ${added_items}    Create List 
    ${start_time}=    Get Time    epoch
    Click Product Add To Cart from product details page   ${SauceLabsBackpack_ButtonButtonName_XPATH}   ${ButtonAddtocart_XPATH_detail} 
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Append To List    ${added_items}    Sauce Labs Backpack
    ${start_time}=    Get Time    epoch
    Click Element     //*[@id="back-to-products"]
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    ${start_time}=    Get Time    epoch
    Click Product Add To Cart from product details page   ${SauceLabsBikeLight_ButtonButtonName_XPATH}   ${ButtonAddtocart_XPATH_detail} 
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Append To List    ${added_items}    Sauce Labs Bike Light
    ${start_time}=    Get Time    epoch
    Click Element     //*[@id="back-to-products"]
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    ${start_time}=    Get Time    epoch
    Click Product Add To Cart from product details page   ${SauceLabsOnesie_ButtonButtonName_XPATH}   ${ButtonAddtocart_XPATH_detail} 
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Append To List    ${added_items}   Sauce Labs Onesie
    ${start_time}=    Get Time    epoch
    Click Element     //*[@id="back-to-products"]
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    # Kiểm tra số lượng trước khi xóa sản phẩm
    ${cart_quantity_before_remove}    Get Text    ${CartQuantity_CSS}
    Log    Số lượng trong giỏ hàng trước khi xóa: ${cart_quantity_before_remove}
    # Xóa 2 sản phẩm từ ctsp
    ${start_time}=    Get Time    epoch
    Click Element   ${SauceLabsBackpack_ButtonButtonName_XPATH}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    ${start_time}=    Get Time    epoch
    Click Element   ${ButtonRemoveocart_XPATH_detail} 
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    ${start_time}=    Get Time    epoch
    Click Element     //*[@id="back-to-products"]
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    ${start_time}=    Get Time    epoch
    Click Element   ${SauceLabsOnesie_ButtonButtonName_XPATH}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    ${start_time}=    Get Time    epoch
    Click Element   ${ButtonRemoveocart_XPATH_detail}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    # Kiểm tra số lượng sau khi xóa sản phẩm
    ${cart_quantity_after_remove}    Get Text    ${CartQuantity_CSS}
    Run Keyword If    '${cart_quantity_before_remove}' != '${cart_quantity_after_remove}'
    ...    Log     Xóa thành công 
    ...    ELSE
    ...    FAIL    Xóa không thành công 
    Run Keyword And Ignore Error    Close Browser

Check if clicking on the cart is successful while waiting for the cookies to run out
    [Documentation]    Kiểm tra nhấn vào giỏ hàng có thành công không khi chờ hết cookie
    Login To Website     ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Element     //*[@id="shopping_cart_container"]/a
    Sleep   3s 
    Page Should Contain      Your Cart 
    Go Back 
    Sleep   900s 
    Click Element     //*[@id="shopping_cart_container"]/a
    Page Should Contain      Swag Labs

*** Keywords ***
Login To Website
    [Arguments]    ${url}    ${browser}    ${username}    ${password}
    Open Browser    ${url}    ${browser}
    Input Text    css=#user-name    ${username}
    Input Password    css=#password    ${password}
    ${start_time}=    Get Time    epoch
    Click Button    css=#login-button
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s


# Thêm 
Add Item To Cart
    [Arguments]    ${product_name}    ${product_xpath}
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains Element    ${product_xpath}    timeout=2s
    ${start_time}=    Get Time    epoch
    Click Element    ${product_xpath}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    css=.shopping_cart_link    timeout=2s
    ${start_time}=    Get Time    epoch
    Click Element    css=.shopping_cart_link
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    ${cart_item_name}=    Get Text    xpath=//div[@class='inventory_item_name']
    Run Keyword If    '${cart_item_name}' == '${product_name}'    Log    Sản phẩm đã được thêm vào giỏ hàng thành công
    ...    ELSE IF    '${cart_item_name}' != ''    Log    Sản phẩm chưa được thêm vào giỏ hàng
    ...    ELSE    Log    Giỏ hàng đang trống
    ...    

Add Item To Cart from the product detail page
    [Arguments]    ${product_name}    ${product_from the product detail page_xpath}   ${product_xpath}
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains Element   ${product_from the product detail page_xpath}    timeout=10s
    ${start_time}=    Get Time    epoch
    Click Element    ${product_from the product detail page_xpath} 
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${product_xpath}    timeout=10s
    ${start_time}=    Get Time    epoch
    Click Element    ${product_xpath}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    ${start_time}=    Get Time    epoch
    Click Element    css=.shopping_cart_link
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    ${cart_item_name}=    Get Text    xpath=//div[@class='inventory_item_name']
    Run Keyword If    '${cart_item_name}' == '${product_name}'    Log    Sản phẩm đã được thêm vào giỏ hàng thành công
    ...    ELSE IF    '${cart_item_name}' != ''    Log    Sản phẩm chưa được thêm vào giỏ hàng
    ...    ELSE    Log    Giỏ hàng đang trống
    ...    
 

Add_Multiple_Products_And_Remove_One
    [Documentation]   Thêm nhiều sản phẩm và xóa một sản phẩm sau khi thêm
    [Arguments]  ${product_xpath_list}
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    # Bước 2: Thêm nhiều sản phẩm vào giỏ hàng
    Log    Bắt đầu thêm sản phẩm vào giỏ hàng
    ${start_time}=    Get Time    epoch
    Click Element    ${product_xpath_list[0]}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    ${start_time}=    Get Time    epoch
    Click Element    ${product_xpath_list[1]}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    ${start_time}=    Get Time    epoch
    Click Element    ${product_xpath_list[2]}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    # Bước 3: Kiểm tra số lượng sản phẩm trước khi xóa
    ${cart_quantity_before_remove}    Get Text    ${CartQuantity_CSS}
    Log    Số lượng sản phẩm trên giỏ hàng sau khi thêm: ${cart_quantity_before_remove}
    # Bước 4: Xóa một sản phẩm sau khi thêm
    ${start_time}=    Get Time    epoch
    Click Element   ${SauceLabsOnesie_ButtonRemove_XPATH} 
    # Bước 5: Kiểm tra số lượng sản phẩm sau khi xóa
    ${cart_quantity_after_remove}    Get Text    ${CartQuantity_CSS}
    Run Keyword If    '${cart_quantity_before_remove}' != '${cart_quantity_after_remove}'
    ...    Log     Xóa thành công 
    ...    ELSE
    ...    FAIL    Xóa không thành công 



Add_Multiple_Products_And_Remove_One_cartitem
    [Documentation]   Thêm nhiều sản phẩm và xóa một sản phẩm sau khi thêm trong giỏ hàng
    [Arguments]  ${product_xpath_list}
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    # Bước 2: Thêm nhiều sản phẩm vào giỏ hàng
    Log    Bắt đầu thêm sản phẩm vào giỏ hàng
    ${start_time}=    Get Time    epoch
    Click Element    ${product_xpath_list[0]}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    ${start_time}=    Get Time    epoch
    Click Element    ${product_xpath_list[1]}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    ${start_time}=    Get Time    epoch
    Click Element    ${product_xpath_list[2]}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    # Bước 3: Kiểm tra số lượng sản phẩm trước khi xóa
    ${cart_quantity_before_remove}    Get Text    ${CartQuantity_CSS}
    Log    Số lượng sản phẩm trên giỏ hàng sau khi thêm: ${cart_quantity_before_remove}
    # Bước 4: Xóa một sản phẩm sau khi thêm
    Go To Shopping Cart
    ${start_time}=    Get Time    epoch
    Click Element   ${SauceLabsOnesie_ButtonRemove_XPATH} 
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    # Bước 5: Kiểm tra số lượng sản phẩm sau khi xóa
    ${cart_quantity_after_remove}    Get Text    ${CartQuantity_CSS}
    Run Keyword If    '${cart_quantity_before_remove}' != '${cart_quantity_after_remove}'
    ...    Log     Xóa thành công 
    ...    ELSE
    ...    FAIL    Xóa không thành công 

Add_Multiple_Products_And_Remove_One_fromctsp
    [Documentation]   Thêm nhiều sản phẩm và xóa một sản phẩm từ trang ctsp 
    [Arguments]  ${product_xpath_list}
    Login To Website   ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    # Bước 2: Thêm nhiều sản phẩm vào giỏ hàng
    Log    Bắt đầu thêm sản phẩm vào giỏ hàng
    ${start_time}=    Get Time    epoch
    Click Element    ${product_xpath_list[0]}
     ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    ${start_time}=    Get Time    epoch
    Click Element    ${product_xpath_list[1]}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    ${start_time}=    Get Time    epoch
    Click Element    ${product_xpath_list[2]}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Wait Until Page Contains Element    ${ShoppingCart_Link_CSS}
    # Bước 3: Kiểm tra số lượng sản phẩm trước khi xóa
    ${cart_quantity_before_remove}    Get Text    ${CartQuantity_CSS}
    Log    Số lượng sản phẩm trên giỏ hàng sau khi thêm: ${cart_quantity_before_remove}
    # Bước 4: Xóa một sản phẩm sau khi thêm
    Sleep  3s
    ${start_time}=    Get Time    epoch
    Click Element    ${SauceLabsBackpack_ButtonButtonName_XPATH}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    ${start_time}=    Get Time    epoch
    Click Element   ${ButtonRemoveocart_XPATH_detail} 
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    # Bước 5: Kiểm tra số lượng sản phẩm sau khi xóa
    ${cart_quantity_after_remove}    Get Text    ${CartQuantity_CSS}
    Run Keyword If    '${cart_quantity_before_remove}' != '${cart_quantity_after_remove}'
    ...    Log     Xóa thành công 
    ...    ELSE
    ...    FAIL    Xóa không thành công 


Add Product With Quantity
    [Documentation]   thêm sản phẩm vào giỏ hàng với số lượng cụ thể
    [Arguments]    ${product}    ${quantity}
    Click Product Add To Cart    ${product_xpaths[${product}]}    # Sử dụng xpath tương ứng với sản phẩm
    Log    Đã thêm ${quantity} sản phẩm ${product} vào giỏ hàng

# Xóa 
Remove Recently Added Product
    [Documentation]    Xóa sản phẩm duy nhất vừa được thêm vào giỏ hàng
    ${start_time}=    Get Time    epoch
    Click Element    ${CartItem_XPATH}    # Click vào trong giỏ hàng
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    ${start_time}=    Get Time    epoch
    Click Element    ${SauceLabsBackpack_ButtonRemove_XPATH}    # Click vào nút xóa của sản phẩm
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Log    Đã xóa sản phẩm đầu tiên khỏi giỏ hàng

Remove many Recently Added Product
    [Documentation]    Xóa nhiều sản phẩm
    ${start_time}=    Get Time    epoch
    Click Element    ${CartItem_XPATH}    # Click vào trong giỏ hàng
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    ${start_time}=    Get Time    epoch
    Click Element    ${SauceLabsBackpack_ButtonRemove_XPATH}    # Click vào nút xóa của sản phẩm
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    ${start_time}=    Get Time    epoch
    Click Element    ${SauceLabsOnesie_ButtonRemove_XPATH} 
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s

Remove Item From Cart
    [Arguments]    ${remove_button_xpath}
    ${start_time}=    Get Time    epoch
    Click Element    ${remove_button_xpath}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Log    Product removed from cart.


Input Username And Password
    [Arguments]    ${username}    ${password}
    Input Text    id=user-name    ${username}
    Input Text    id=password    ${password}
    ${start_time}=    Get Time    epoch
    Click Button    css:.btn_action
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s

Click Product Add To Cart
    [Arguments]    ${locator}
    ${start_time}=    Get Time    epoch
    Click Element    ${locator}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Log    Product added to cart.


Click Product Add To Cart from product details page
    [Arguments]    ${locator1}      ${locator2}
    ${start_time}=    Get Time    epoch
    Click Element   ${locator1}  
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    ${start_time}=    Get Time    epoch
    Click Element   ${locator2}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Log    Product added to cart.


Check Cart Quantity
    [Arguments]    ${expected_quantity}
    ${start_time}=    Get Time    epoch
    Click Element    ${ShoppingCart_Link_CSS}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    ${cart_quantity}    Get Text    ${CartQuantity_CSS}
    Should Be Equal As Numbers    ${cart_quantity}    ${expected_quantity}
    Log    Cart quantity is ${cart_quantity}.

Go To Shopping Cart
    ${start_time}=    Get Time    epoch
    Click Element    ${ShoppingCart_Link_CSS}
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Log    Navigated to shopping cart.

Check Cart Items
    Wait Until Element Is Visible    ${CartItem_XPATH}
    ${cart_items}    Get Text    ${CartItem_XPATH}
    Log    ${cart_items}



Handle Possible Error
    ${error_message} =    Run Keyword And Return Status    Page Should Contain Element    ${EXPECTED_ERROR_MESSAGE}
    Run Keyword If    ${error_message}    Log    Thông báo lỗi xuất hiện: ${EXPECTED_ERROR_MESSAGE}
    ...    ELSE    Log    Không có thông báo lỗi nào xuất hiện

