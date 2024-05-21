*** Settings ***
Test Setup        Open Browser    ${URL}    ${BROWSER}
Test Teardown     Close Browser
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com
${USERNAME}       performance_glitch_user
${PASSWORD}       secret_sauce
${URL_PRODUCT_PAGE}    https://www.saucedemo.com/inventory.html
${URL_CART_PAGE}    https://www.saucedemo.com/cart.html
${URL_CHECKOUT_FILL_INFO_PAGE}    https://www.saucedemo.com/checkout-step-one.html
${URL_CHECKOUT_INFO_PAGE}    https://www.saucedemo.com/checkout-step-two.html
${URL_CHECKOUT_COMPLETE_PAGE}    https://www.saucedemo.com/checkout-complete.html

${RESPONSE_THRESHOLD}  1
${performance_issue_message}    Trang web gặp vấn đề về hiệu suất

*** Test Cases ***
Payment success and check performance
    [Documentation]    kiểm tra việc thanh toán thành công và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    Fill Payment Info    Nguyen    Van    111
    Check Bill And Paid
    Verify Success Text
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}

Check the payment is successful when pressing the Enter key and check performance
    [Documentation]    kiểm tra việc thanh toán thành công khi nhấn bằng phím Enter và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    Fill Payment Info    Nguyen    Van    111
    ${start_time}=    Get Time    epoch
    Click Element    continue
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Press Keys    //*[@id="finish"]   ENTER 
    Page Should Contain   Checkout: Complete!
    Verify Success Text
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}

Check payment information when purchasing a product and check performance
    [Documentation]    Kiểm tra thông tin thanh toán khi mua 1 sản phẩm và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    Fill Payment Info    Nguyen    Van    111
    ${start_time}=    Get Time    epoch
    Click Element    continue
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep  3s
    ${expected_product} =    Set Variable    QTYDescription\n1\nSauce Labs Backpack\ncarry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.\n$29.99
    ${expected_content} =    Set Variable    Payment Information:\nSauceCard #31337\nShipping Information:\nFree Pony Express Delivery!\nPrice Total\nItem total: $29.99\nTax: $2.40\nTotal: $32.39\nCancel\nFinish 
    Check invoice information    ${expected_product}    ${expected_content}
    ${start_time}=    Get Time    epoch
    Click Button    finish
    Verify Success Text
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
Check payment information when purchasing multiple products and check performance
    [Documentation]    Kiểm tra thông tin thanh toán khi mua nhiều sản phẩm và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Add Product to Cart    add-to-cart-sauce-labs-bike-light
    Check Cart And Checkout
    Fill Payment Info    Nguyen    Van    111
    ${start_time}=    Get Time    epoch
    Click Element    continue
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep  3s
    Sleep  3s
    ${expected_product} =    Set Variable    QTYDescription\n1\nSauce Labs Backpack\ncarry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.\n$29.99\n1\nSauce Labs Bike Light\nA red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included.\n$9.99
    ${expected_content} =    Set Variable    Payment Information:\nSauceCard #31337\nShipping Information:\nFree Pony Express Delivery!\nPrice Total\nItem total: $39.98\nTax: $3.20\nTotal: $43.18\nCancel\nFinish 
    Check invoice information    ${expected_product}    ${expected_content}
    ${start_time}=    Get Time    epoch
    Click Button    finish
    Verify Success Text
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}

Kiểm tra thông tin thanh toán khi không mua sản phẩm nào and check performance
    [Documentation]    Kiểm tra thông tin thanh toán khi không mua sản phẩm nào (giỏ hàng trống) và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Check Cart And Checkout
    Fill Payment Info    Nguyen    Van    111
    ${start_time}=    Get Time    epoch
    Click Element    continue
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep  3s
    Sleep  3s
    ${expected_product} =    Set Variable    ${EMPTY}
    ${expected_content} =    Set Variable    Payment Information:\nSauceCard #31337\nShipping Information:\nFree Pony Express Delivery!\nPrice Total\nItem total: $0\nTax: $0.00\nTotal: $0.00\nCancel\nFinish 
    Check Invoice Information when the cart is empty    ${expected_product}    ${expected_content}
    ${start_time}=    Get Time    epoch
    Click Button    finish
    Verify Success Text
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    
Payment With An Empty Cart and check performance
    [Documentation]    kiểm tra xem có thông báo lỗi khi thanh toán với giỏ hàng trống không và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Check Cart And Checkout
    ${Is_visible}    Run Keyword And Return Status    Element Should Be Visible    //span[@class='title']
    Run Keyword If    ${Is_visible}==True    Fail    Không thông báo lỗi "Giỏ hàng trống"
    ...    ELSE    Log    Không thanh toán thành công
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    
Payment With Empty Firstname and check performance
    [Documentation]    Kiểm tra thanh toán nếu bỏ trống Firstname và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    Fill Payment Info    \    aaa    aaa
    Verify Error Firstname Text
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
Payment With Empty Lastname and check performance
    [Documentation]    Kiểm tra thanh toán nếu bỏ trống Lastname và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    Fill Payment Info    aaa    \    aaa
    Verify Error Lastname Text
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
Payment With Empty PostalCode and check performance
    [Documentation]    Kiểm tra thanh toán nếu bỏ trống PostalCode và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    Fill Payment Info    aaa    aaa    \
    Verify Error PostalCode Text
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
Payment With Not Exist PostalCode and check performance
    [Documentation]    Kiểm tra thanh toán nếu PostalCode không tồn tại và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    ${Text}    Get Text    //span[@class='title']
    Fill Payment Info    Nguyen    Van    @@@@
    Check Bill And Paid
    ${Is_visible}    Run Keyword And Return Status    Element Text Should Be    //span[@class='title']    ${Text}
    Run Keyword If    ${Is_visible}==False   Fail     Không thông báo lỗi "Mã Postal không tồn tại"
    ...    ELSE    Log    Có thông báo xuất hiện lỗi
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}

Payment With Wrong Character Firstname and check performance
    [Documentation]    Kiểm tra thanh toán nếu Firstname không tồn tại và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    ${Text}    Get Text    //span[@class='title']
    Fill Payment Info    Nguy@n    Van    111
    Check Bill And Paid
    ${Is_visible}    Run Keyword And Return Status    Element Text Should Be    //span[@class='title']    ${Text}
    Run Keyword If    ${Is_visible}==False    Fail    Không thông báo lỗi "Firstname không tồn tại"
    ...    ELSE    Log    Có thông báo xuất hiện lỗi
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}

Payment With Wrong Character Lastname and check performance
    [Documentation]    Kiểm tra thanh toán nếu Lastname không tồn tại và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    ${Text}    Get Text    //span[@class='title']
    Fill Payment Info    Nguyen    @@@@    111
    Check Bill And Paid
    ${Is_visible}    Run Keyword And Return Status    Element Text Should Be    //span[@class='title']    ${Text}
    Run Keyword If    ${Is_visible}==False    Fail    Không thông báo lỗi "Lastname không tồn tại"
    ...    ELSE    Log    Có thông báo xuất hiện lỗi
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}

Payment with Firstname contains spaces and check performance
    [Documentation]    Kiểm tra thanh toán nếu Firstname chứa khoảng trắng và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    ${Text}    Get Text    //span[@class='title']
    Fill Payment Info    Ng uyen    @@@@    111
    Check Bill And Paid
    ${Is_visible}    Run Keyword And Return Status    Element Text Should Be    //span[@class='title']    ${Text}
    Run Keyword If    ${Is_visible}==False    Fail    Không thông báo lỗi "Firstname không tồn tại"
    ...    ELSE    Log    Có thông báo xuất hiện lỗi
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    
Payment with Lastname contains spaces and check performance
    [Documentation]    Kiểm tra thanh toán nếu Lastname chứa khoảng trắng và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    ${Text}    Get Text    //span[@class='title']
    Fill Payment Info    Nguyen    Va n    111
    Check Bill And Paid
    ${Is_visible}    Run Keyword And Return Status    Element Text Should Be    //span[@class='title']    ${Text}
    Run Keyword If    ${Is_visible}==False    Fail    Không thông báo lỗi "Lastname không tồn tại"
    ...    ELSE    Log    Có thông báo xuất hiện lỗi
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}

Payment with PostalCode contains spaces and check performance
    [Documentation]    Kiểm tra thanh toán nếu PostalCode chứa khoảng trắng và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    ${Text}    Get Text    //span[@class='title']
    Fill Payment Info    Nguyen    Van    1 11
    Check Bill And Paid
    ${Is_visible}    Run Keyword And Return Status    Element Text Should Be    //span[@class='title']    ${Text}
    Run Keyword If    ${Is_visible}==False    Fail    Không thông báo lỗi "Mã Postal không tồn tại"
    ...    ELSE    Log    Có thông báo xuất hiện lỗi
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}

Return to cart from checkout_fill page and check performance
    [Documentation]    Kiểm tra việc quay lại giỏ hàng từ trang nhập thông tin thanh toán và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    Wait Until Element Is Visible    cancel
    ${start_time}=    Get Time    epoch
    Click Element    cancel
    Location Should Be    ${URL_CART_PAGE}
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}

Return to checkout_fill page from checkout_overview page and check performance
    [Documentation]    Kiểm tra việc quay lại trang điền thông tin thanh toán từ trang xác nhận thanh toán và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    Fill Payment Info    Nguyen    Van    111
    ${start_time}=    Get Time    epoch
    Click Element    continue
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep  3s
    Wait Until Element Is Visible    cancel
    ${start_time}=    Get Time    epoch
    Click Element    cancel
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep  3s
    ${Is_visible}    Run Keyword And Return Status    Location Should Be    ${URL_CHECKOUT_FILL_INFO_PAGE}
    Run Keyword If    ${Is_visible}==False    Fail    Không chuyển đển trang điền thông tin thanht toán
    ...    ELSE    Log    Đã chuyển đến trang điền thông tin thanht toán
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}

Continue shopping after payment and check performance
    [Documentation]    Kiểm tra có thể tiếp tục mua hàng sau khi thanh toán và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    Fill Payment Info    Nguyen    Van    111
    Check Bill And Paid
    ${start_time}=    Get Time    epoch
    Click Element    back-to-products
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep  3s
    ${Is_visible}    Run Keyword And Return Status    Location Should Be    ${URL_PRODUCT_PAGE}
    Run Keyword If    ${Is_visible}==True   Log    Đã chuyển đến trang mua hàng
    ...    ELSE      Fail    Không chuyển đển trang mua hàng
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}

Saving payment information for the next payment and check performance
    [Documentation]    Kiểm tra việc lưu thông tin thanh toán cho lần thanh toán tiếp theo và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    Fill Payment Info    Nguyen    Van    111
    ${Value_before}    Get Element Attribute    firstName    value
    Check Bill And Paid
    ${start_time}=    Get Time    epoch
    Click Element    back-to-products
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep  3s
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    ${Value_after}    Get Element Attribute    firstName    value
    ${Status}    Run Keyword And Return Status    Should Be Equal As Strings    ${Value_before}    ${Value_after}
    Run Keyword If    ${Status}==True      Log    Đã lưu lại thông tin
    ...    ELSE    Fail    Không lưu lại thông tin
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}
    
The invoice display after filling in payment information 
    [Documentation]    Kiểm tra hiển thị hóa đơn sau khi điền thông tin thanh toán và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    Fill Payment Info    Nguyen    Van    111
    ${start_time}=    Get Time    epoch
    Click Element    continue
    ${Is_visible}    Run Keyword And Return Status    Element Should Be Visible    //div[@class='summary_info']
    Run Keyword If    ${Is_visible}==True    Log    Đã hiện hoá đơn
    ...    ELSE    Fail    Không hiện hoá đơn
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}

Total amount in the order and check performance
    [Documentation]    Kiểm tra việc tính toán tổng số tiền trong đơn hàng và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    Fill Payment Info    Nguyen    Van    111
    ${start_time}=    Get Time    epoch
    Click Element    continue
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep  3s
    ${Expected_total}    Set Variable    32.39
    ${Total_amount}    Get Text    //div[@class='summary_total_label']
    ${Is_visible}    Run Keyword And Return Status    Should Contain    ${Total_amount}    ${Expected_total}
    Run Keyword If    ${Is_visible}==True    Log    Đã tính đúng hoá đơn
    ...    ELSE    Fail    Đã tính sai hoá đơn
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}

Payment success without filling in information and check performance
    [Documentation]    Kiểm tra thanh toán thành công mà không cần bước điền thông tin và kiểm tra hiệu xuất 
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Go to    ${URL_CHECKOUT_INFO_PAGE}
    ${Is_visible}    Run Keyword And Return Status    Element Should Be Visible    //div[@class='summary_info']
    Run Keyword If    ${Is_visible}==True    Log    Thiếu thông báo lỗi "Cần nhập thông tin đặt hàng"
    ...    ELSE    Fail     Thông báo lỗi "Cần nhập thông tin đặt hàng"
    Run Keyword If    '${performance_issue_message}' != ''
    ...    Log     ${performance_issue_message}

*** Keywords ***
Input Username And Password
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Wait Until Element Is Visible    user-name
    Input Text    user-name    ${USERNAME}
    Wait Until Element Is Visible    password
    Input Password    password    ${PASSWORD}
    Wait Until Element Is Visible    login-button
    ${start_time}=    Get Time    epoch
    Click Element    login-button
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep  3s

Add Product to Cart
    [Arguments]    ${Button}
    ${start_time}=    Get Time    epoch
    Click Button    ${Button}

Check Cart And Checkout
    ${start_time}=    Get Time    epoch
    Click Link    //a[@class='shopping_cart_link']
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep  3s
    ${start_time}=    Get Time    epoch
    Click Button    Checkout
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep  3s

Check Bill And Paid
    ${start_time}=    Get Time    epoch
    Click Element    continue
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep  3s
    ${start_time}=    Get Time    epoch
    Click Button    finish
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep  3s


Successful Purchase
    Add Product to Cart    add-to-cart-sauce-labs-backpack
    Check Cart And Checkout
    Fill Payment Info    Nguyen    Van    111
    Check Bill And Paid

Fill Payment Info
    [Arguments]    ${First_Name}=${EMPTY}    ${Last_Name}=${EMPTY}    ${ZipOrPos_Code}=${EMPTY}
    Wait Until Element Is Visible    firstName
    Input Text    firstName    ${First_Name}
    Wait Until Element Is Visible    lastName
    Input Text    lastName    ${Last_Name}
    Wait Until Element Is Visible    postalCode
    Input Text    postalCode    ${ZipOrPos_Code}

Verify Success Text
    Wait Until Element Is Visible    //h2[@class='complete-header']
    Element Text Should Be    //h2[@class='complete-header']    Thank you for your order!

Verify Cart Text
    Wait Until Element Is Visible    //span[@class='title']
    Element Text Should Be    //span[@class='title']    Checkout: Your Information

Verify Error Firstname Text
    ${start_time}=    Get Time    epoch
    Click Element    continue
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep  3s
    Wait Until Element Is Visible    //h3[normalize-space()='Error: First Name is required']
    Element Text Should Be    //h3[normalize-space()='Error: First Name is required']    Error: First Name is required

Verify Error Lastname Text
    ${start_time}=    Get Time    epoch
    Click Element    continue
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep  3s
    Wait Until Element Is Visible    //h3[normalize-space()='Error: Last Name is required']
    Element Text Should Be    //h3[normalize-space()='Error: Last Name is required']    Error: Last Name is required

Verify Error PostalCode Text
    ${start_time}=    Get Time    epoch
    Click Element    continue
    ${end_time}=    Get Time    epoch
    ${response_time}=    Evaluate    ${end_time} - ${start_time}
    Log    Thời gian phản hồi của trang web là ${response_time} milliseconds
    Run Keyword If    ${response_time} > ${RESPONSE_THRESHOLD}
    ...     Log   thời gian phản hồi lớn hơn 1s
    Sleep  3s
    Wait Until Element Is Visible    //h3[normalize-space()='Error: Postal Code is required']
    Element Text Should Be    //h3[normalize-space()='Error: Postal Code is required']    Error: Postal Code is required

Check Invoice Information
    [Arguments]    ${expected_product}    ${expected_content}
    ${product_list} =    Get WebElements    //div[@class="cart_item"]
    ${product} =     Get Text  //div[@class="cart_list"]
    ${result_product} =    Compare Product    ${product}    ${expected_product}

    ${content} =    Get Text    //*[@id="checkout_summary_container"]/div/div[2]
    ${result_content} =    Compare Content    ${content}    ${expected_content}

    Run Keyword If    ${result_product} == True and ${result_content} == True    Log    Invoice information matches expected values
    ...    ELSE    Fail    Invoice information does not match expected values


Compare Product
    [Arguments]    ${product_text}    ${expected_product}
    ${result} =    Run Keyword And Return Status    Should Be Equal As Strings    ${product_text}    ${expected_product}
    Return From Keyword    ${result}

Compare Content
    [Arguments]    ${content_text}    ${expected_content}
    ${result} =    Run Keyword And Return Status    Should Be Equal As Strings    ${content_text}    ${expected_content}
    Return From Keyword    ${result}

Check Invoice Information when the cart is empty
    [Arguments]    ${expected_product}    ${expected_content}
    ${product_list} =    Run Keyword And Return Status    Element Should Be Visible    //div[@class="cart_item"]
    Run Keyword If    ${product_list}    Compare Product And Content    ${expected_product}    ${expected_content}
    ...    ELSE    Compare Empty Cart Content    ${expected_content}

Compare Product And Content
    [Arguments]    ${expected_product}    ${expected_content}
    ${product} =     Get Text  //div[@class="cart_list"]
    ${result_product} =    Compare Product    ${product}    ${expected_product}

    ${content} =    Get Text    //*[@id="checkout_summary_container"]/div/div[2]
    ${result_content} =    Compare Content    ${content}    ${expected_content}

    Run Keyword If    ${result_product} == True and ${result_content} == True    Log    Invoice information matches expected values
    ...    ELSE    Fail    Invoice information does not match expected values

Compare Empty Cart Content
    [Arguments]    ${expected_content}
    ${content} =    Get Text    //*[@id="checkout_summary_container"]/div/div[2]
    ${result_content} =    Compare Content    ${content}    ${expected_content}

    Run Keyword If    ${result_content} == True    Log    Empty cart content matches expected values
    ...    ELSE    Fail    Empty cart content does not match expected values
