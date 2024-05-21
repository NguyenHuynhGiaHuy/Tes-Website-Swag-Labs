*** Settings ***
Library           SeleniumLibrary
Library          RequestsLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com/
${VALID_USERNAME}              visual_user
${VALID_PASSWORD}              secret_sauce
${CartQuantity_CSS}                          //*[@id="shopping_cart_container"]/a/span

${inventory_container_XPATH}    //*[@id="inventory_container"]



*** Test Cases ***
Check filter function (A to Z)
    [Documentation]    Kiểm tra chức năng lọc (A to Z)
    Login To Website     ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Page Should Contain    Products
    Select From List By Label    css=.product_sort_container    Name (A to Z)
    ${selected_option}    Get Text    css=.active_option
    Should Be Equal As Strings    ${selected_option}    Name (A to Z)
    Close Browser

Check filter function (Z to A)
    [Documentation]    Kiểm tra chức năng lọc (Z to A)
    Login To Website     ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Page Should Contain    Products
    Select From List By Label    css=.product_sort_container    Name (Z to A)
    ${selected_option}    Get Text    css=.active_option
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    Close Browser

Check filter function (low to high)
    [Documentation]    Kiểm tra chức năng lọc (low to high)
    Login To Website     ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Page Should Contain    Products
    Select From List By Label    css=.product_sort_container    Price (low to high)
    ${selected_option}    Get Text    css=.active_option
    Should Be Equal As Strings    ${selected_option}     Price (low to high)
    Close Browser

Check filter function (high to low)
    [Documentation]    Kiểm tra chức năng lọc (high to low)
    Login To Website     ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Page Should Contain    Products
    Select From List By Label    css=.product_sort_container    Price (high to low)
    ${selected_option}    Get Text    css=.active_option
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    Close Browser


Check the correctness of filtering (A to Z)
    [Documentation]    Kiểm tra tính đúng đắn khi lọc sản phẩm từ A đến Z
    Login To Website     ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Label    css=.product_sort_container    Name (A to Z)
    ${expected_product_names}    Create List    Sauce Labs Backpack    Sauce Labs Bike Light    Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket    Sauce Labs Onesie    Test.allTheThings() T-Shirt (Red)
    ${actual_product_names}    Get WebElements    css=.inventory_item_name
    ${actual_product_names_texts}    Create List
    FOR    ${element}    IN    @{actual_product_names}
        ${text}    Get Text    ${element}
        Append To List    ${actual_product_names_texts}    ${text}
    END
    Should Be Equal    ${expected_product_names}    ${actual_product_names_texts}
    Close Browser



Check the correctness of filtering (Z to A)
    [Documentation]    Kiểm tra tính đúng đắn khi lọc (Z to A)
    Login To Website     ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select From List By Label    css=.product_sort_container    Name (Z to A)
    ${expected_product_names}    Create List   Test.allTheThings() T-Shirt (Red)     Sauce Labs Onesie     Sauce Labs Fleece Jacket     Sauce Labs Bolt T-Shirt     Sauce Labs Bike Light     Sauce Labs Backpack
    ${actual_product_names}    Get WebElements    css=.inventory_item_name
    ${actual_product_names_texts}    Create List
    FOR    ${element}    IN    @{actual_product_names}
        ${text}    Get Text    ${element}
        Append To List    ${actual_product_names_texts}    ${text}
    END
    Should Be Equal    ${expected_product_names}    ${actual_product_names_texts}
    Close Browser


Check the correctness of Filtering (Low to High)
    [Documentation]    Kiểm tra tính đúng đắn khi lọc từ thấp đến cao
    Login To Website     ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Page Should Contain    Products
    Select From List By Label    css=.product_sort_container    Price (low to high)
    ${expected_prices_low_to_high}    Create List     $7.99    $9.99    $15.99    $15.99    $29.99    $49.99   
    ${actual_prices}    Get WebElements    css=.inventory_item_price
    ${actual_prices_texts}    Create List
    FOR    ${price}    IN    @{actual_prices}
        ${text}    Get Text    ${price}
        Append To List    ${actual_prices_texts}    ${text}
    END
    Should Be Equal    ${expected_prices_low_to_high}    ${actual_prices_texts}
    Close Browser

Check the correctness of filtering (high to low)
    [Documentation]   Kiểm tra tính đúng đắn khi lọc  (high to low)
    Login To Website     ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Page Should Contain    Products
    Select From List By Label    css=.product_sort_container    Price (high to low)
    ${expected_prices_low_to_high}    Create List     $49.99    $29.99    $15.99    $15.99    $9.99    $7.99          
    ${actual_prices}    Get WebElements    css=.inventory_item_price
    ${actual_prices_texts}    Create List
    FOR    ${price}    IN    @{actual_prices}
        ${text}    Get Text    ${price}
        Append To List    ${actual_prices_texts}    ${text}
    END 
    Should Be Equal    ${expected_prices_low_to_high}    ${actual_prices_texts}
    Close Browser



Test the entire filter function one at a time
    [Documentation]    Kiểm tra chức năng lọc toàn bộ 1 lần lượt
    Login To Website     ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Page Should Contain    Products

    # Test sorting by Name (A to Z)
    Select From List By Label    css=.product_sort_container    Name (A to Z)
    ${selected_option}    Get Text    css=.active_option
    Should Be Equal As Strings    ${selected_option}    Name (A to Z)


    # Test sorting by Name (Z to A)
    Select From List By Label    css=.product_sort_container    Name (Z to A)
    ${selected_option}    Get Text    css=.active_option
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)


    # Test sorting by Price (low to high)
    Select From List By Label    css=.product_sort_container    Price (low to high)
    ${selected_option}    Get Text    css=.active_option
    Should Be Equal As Strings    ${selected_option}     Price (low to high)


    # Test sorting by Price (high to low)
    Select From List By Label    css=.product_sort_container    Price (high to low)
    ${selected_option}    Get Text    css=.active_option
    Should Be Equal As Strings    ${selected_option}    Price (high to low)

    Close Browser

Test entire filter function one by one
    [Documentation]    Kiểm tra tính đúng đắn của việc lọc toàn bộ sản phẩm một cách tuần tự
    Login To Website     ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Page Should Contain    Products

    # Kiểm tra sắp xếp theo Tên (A đến Z)
    Select From List By Label    css=.product_sort_container    Name (A to Z)
    ${expected_product_names}    Create List    Sauce Labs Backpack    Sauce Labs Bike Light    Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket    Sauce Labs Onesie    Test.allTheThings() T-Shirt (Red)
    ${actual_product_names}    Get WebElements    css=.inventory_item_name
    ${actual_product_names_texts}    Create List
    FOR    ${element}    IN    @{actual_product_names}
        ${text}    Get Text    ${element}
        Append To List    ${actual_product_names_texts}    ${text}
    END
    Should Be Equal    ${expected_product_names}    ${actual_product_names_texts}

    # Kiểm tra sắp xếp theo Tên (Z đến A)
    Select From List By Label    css=.product_sort_container    Name (Z to A)
    ${expected_product_names}    Create List   Test.allTheThings() T-Shirt (Red)     Sauce Labs Onesie     Sauce Labs Fleece Jacket     Sauce Labs Bolt T-Shirt     Sauce Labs Bike Light     Sauce Labs Backpack
    ${actual_product_names}    Get WebElements    css=.inventory_item_name
    ${actual_product_names_texts}    Create List
    FOR    ${element}    IN    @{actual_product_names}
        ${text}    Get Text    ${element}
        Append To List    ${actual_product_names_texts}    ${text}
    END
    Should Be Equal    ${expected_product_names}    ${actual_product_names_texts}

    # Kiểm tra sắp xếp theo Giá (thấp đến cao)
    Select From List By Label    css=.product_sort_container    Price (low to high)
    ${expected_prices_low_to_high}    Create List     $7.99    $9.99    $15.99    $15.99    $29.99    $49.99   
    ${actual_prices}    Get WebElements    css=.inventory_item_price
    ${actual_prices_texts}    Create List
    FOR    ${price}    IN    @{actual_prices}
        ${text}    Get Text    ${price}
        Append To List    ${actual_prices_texts}    ${text}
    END
    Should Be Equal    ${expected_prices_low_to_high}    ${actual_prices_texts}

    # Kiểm tra sắp xếp theo Giá (cao đến thấp)
    Select From List By Label    css=.product_sort_container    Price (high to low)
    ${selected_option}    Get Text    css=.active_option
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    ${expected_prices_low_to_high}    Create List     $49.99    $29.99    $15.99    $15.99    $9.99    $7.99          
    ${actual_prices}    Get WebElements    css=.inventory_item_price
    ${actual_prices_texts}    Create List
    FOR    ${price}    IN    @{actual_prices}
        ${text}    Get Text    ${price}
        Append To List    ${actual_prices_texts}    ${text}
    END 
    Should Be Equal    ${expected_prices_low_to_high}    ${actual_prices_texts}

    Close Browser

Test Filter Icon Click Content
    [Documentation]    Kiểm tra nội dung sau khi nhấn vào icon lọc
    Login To Website     ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Page Should Contain    Products

    # Nhấn vào icon lọc
    Click Element    css=.product_sort_container

    # Kiểm tra các tùy chọn trong dropdown
    Wait Until Element Is Visible    css=.product_sort_container option[value="az"]
    Wait Until Element Is Visible    css=.product_sort_container option[value="za"]
    Wait Until Element Is Visible    css=.product_sort_container option[value="lohi"]
    Wait Until Element Is Visible    css=.product_sort_container option[value="hilo"]

    # Kiểm tra nội dung của các tùy chọn
    ${option_A_to_Z}    Get Text    css=.product_sort_container option[value="az"]
    ${option_Z_to_A}    Get Text    css=.product_sort_container option[value="za"]
    ${option_low_to_high}    Get Text    css=.product_sort_container option[value="lohi"]
    ${option_high_to_low}    Get Text    css=.product_sort_container option[value="hilo"]

    Should Be Equal As Strings    ${option_A_to_Z}    Name (A to Z)
    Should Be Equal As Strings    ${option_Z_to_A}    Name (Z to A)
    Should Be Equal As Strings    ${option_low_to_high}    Price (low to high)
    Should Be Equal As Strings    ${option_high_to_low}    Price (high to low)

    Close Browser




*** Keywords ***
Login To Website
    [Arguments]    ${url}    ${browser}    ${username}    ${password}
    Open Browser    ${url}    ${browser}
    Input Text    css=#user-name    ${username}
    Input Password    css=#password    ${password}
    Click Button    css=#login-button



#11 tests, 11 passed, 0 failed