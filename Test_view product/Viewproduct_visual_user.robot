*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com/
${VALID_USERNAME}              visual_user
${VALID_PASSWORD}              secret_sauce
${CartQuantity_CSS}                          //*[@id="shopping_cart_container"]/a/span
${PRODUCT_ITEM_XPATH}    xpath=//*[@class='inventory_item']
${EXPECTED_ITEM_COUNT}    6


# Xpath từng item (sản phẩm)
${Sauce Labs Backpack_XPATH}                  //*[@id="inventory_container"]/div/div[1] 
${Sauce Labs Bike Light_XPATH}                //*[@id="inventory_container"]/div/div[2]
${Sauce Labs Bolt T-Shirt_XPATH}               //*[@id="inventory_container"]/div/div[3]
${Sauce Labs Fleece Jacket_XPATH}             //*[@id="inventory_container"]/div/div[4]
${Sauce Labs Onesie_XPATH}                    //*[@id="inventory_container"]/div/div[5]
${Sauce Labs Red T-Shirt_XPATH}               //*[@id="inventory_container"]/div/div[6]

# Xpath từng item trên trang ctsp 
${Sauce Labs Backpack_Details_XPATH}                  //*[@id="inventory_item_container"]/div
${Sauce Labs Bike Light_Details_XPATH}                //*[@id="inventory_item_container"]/div
${Sauce Labs Bolt T-Shirt_Details_XPATH}               //*[@id="inventory_item_container"]/div
${Sauce Labs Fleece Jacket_Details_XPATH}             //*[@id="inventory_item_container"]/div
${Sauce Labs Onesie_Details_XPATH}                    //*[@id="inventory_item_container"]/div
${Sauce Labs Red T-Shirt_Details_XPATH}              //*[@id="inventory_item_container"]/div

*** Test Cases ***

Test Product Items Count
    [Documentation]    Kiểm tra số lượng item sản phẩm trên một trang
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains Element    ${PRODUCT_ITEM_XPATH}    timeout=10s
    ${elements}    Get Web Elements    ${PRODUCT_ITEM_XPATH}
    ${actual_item_count}    Get Length    ${elements}
    Should Be Equal As Numbers    ${actual_item_count}    ${EXPECTED_ITEM_COUNT}    msg=Số lượng item sản phẩm không đúng trên trang
    Close Browser

Check Product Content_Homepage
    [Documentation]    Kiểm tra nội dung của sản phẩm trên trang chính 
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Check Product    ${Sauce Labs Backpack_XPATH}    Sauce Labs Backpack    https://www.saucedemo.com/static/media/sauce-backpack-1200x1500.0a0b85a3.jpg    carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.    $29.99
    Check Product     ${Sauce Labs Bike Light_XPATH}    Sauce Labs Bike Light    https://www.saucedemo.com/static/media/bike-light-1200x1500.37c843b0.jpg    A red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included.    $9.99
    Check Product     ${Sauce Labs Bolt T-Shirt_XPATH}     Sauce Labs Bolt T-Shirt    	https://www.saucedemo.com/static/media/bolt-shirt-1200x1500.c2599ac5.jpg    Get your testing superhero on with the Sauce Labs bolt T-shirt. From American Apparel, 100% ringspun combed cotton, heather gray with red bolt.      $15.99
    Check Product     ${Sauce Labs Fleece Jacket_XPATH}       Sauce Labs Fleece Jacket   https://www.saucedemo.com/static/media/sauce-pullover-1200x1500.51d7ffaf.jpg       It's not every day that you come across a midweight quarter-zip fleece jacket capable of handling everything from a relaxing day outdoors to a busy day at the office.    $49.99
    Check Product    ${Sauce Labs Onesie_XPATH}        Sauce Labs Onesie   https://www.saucedemo.com/static/media/red-onesie-1200x1500.2ec615b2.jpg      Rib snap infant onesie for the junior automation engineer in development. Reinforced 3-snap bottom closure, two-needle hemmed sleeved and bottom won't unravel.   $7.99
    Check Product     ${Sauce Labs Red T-Shirt_XPATH}   Test.allTheThings() T-Shirt (Red)      	https://www.saucedemo.com/static/media/red-tatt-1200x1500.30dadef4.jpg        This classic Sauce Labs t-shirt is perfect to wear when cozying up to your keyboard to automate a few tests. Super-soft and comfy ringspun combed cotton.     $15.99
    Close Browser  

Check Product Content_Details_Click_image 
    [Documentation]    Kiểm tra nội dung của sản phẩm trên trang chi tiết sản phẩm khi nhấn vô ảnh của sản phẩm
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Image      ${Sauce Labs Backpack_XPATH}
    Check Product Details    ${Sauce Labs Backpack_Details_XPATH}    Sauce Labs Backpack    https://www.saucedemo.com/static/media/sauce-backpack-1200x1500.0a0b85a3.jpg    carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.    $29.99
    Click Element    xpath=//*[@id="back-to-products"]
    Click Product Image      ${Sauce Labs Bike Light_XPATH}
    Check Product Details    ${Sauce Labs Bike Light_Details_XPATH}    Sauce Labs Bike Light    https://www.saucedemo.com/static/media/bike-light-1200x1500.37c843b0.jpg    A red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included.    $9.99
    Click Element    xpath=//*[@id="back-to-products"]
    Click Product Image      ${Sauce Labs Bolt T-Shirt_XPATH} 
    Check Product Details    ${Sauce Labs Bolt T-Shirt_Details_XPATH}     Sauce Labs Bolt T-Shirt     https://www.saucedemo.com/static/media/bolt-shirt-1200x1500.c2599ac5.jpg    Get your testing superhero on with the Sauce Labs bolt T-shirt. From American Apparel, 100% ringspun combed cotton, heather gray with red bolt.      $15.99
    Click Element    xpath=//*[@id="back-to-products"]
    Click Product Image      ${Sauce Labs Fleece Jacket_XPATH}
    Check Product Details    ${Sauce Labs Fleece Jacket_Details_XPATH}       Sauce Labs Fleece Jacket   https://www.saucedemo.com/static/media/sauce-pullover-1200x1500.51d7ffaf.jpg       It's not every day that you come across a midweight quarter-zip fleece jacket capable of handling everything from a relaxing day outdoors to a busy day at the office.    $49.99
    Click Element    xpath=//*[@id="back-to-products"]
    Click Product Image      ${Sauce Labs Onesie_XPATH} 
    Check Product Details    ${Sauce Labs Onesie_Details_XPATH}        Sauce Labs Onesie   https://www.saucedemo.com/static/media/red-onesie-1200x1500.2ec615b2.jpg      Rib snap infant onesie for the junior automation engineer in development. Reinforced 3-snap bottom closure, two-needle hemmed sleeved and bottom won't unravel.   $7.99
    Click Element    xpath=//*[@id="back-to-products"]
    Click Product Image      ${Sauce Labs Red T-Shirt_XPATH}  
    Check Product Details    ${Sauce Labs Red T-Shirt_Details_XPATH}   Test.allTheThings() T-Shirt (Red)       https://www.saucedemo.com/static/media/red-tatt-1200x1500.30dadef4.jpg        This classic Sauce Labs t-shirt is perfect to wear when cozying up to your keyboard to automate a few tests. Super-soft and comfy ringspun combed cotton.     $15.99
    Close Browser  

Check Product Content_Details_Click_text
    [Documentation]    Kiểm tra nội dung của sản phẩm trên trang chi tiết sản phẩm khi nhấn vô tên sản phẩm
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Text      ${Sauce Labs Backpack_XPATH}
    Check Product Details    ${Sauce Labs Backpack_Details_XPATH}    Sauce Labs Backpack    https://www.saucedemo.com/static/media/sauce-backpack-1200x1500.0a0b85a3.jpg    carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.    $29.99
    Click Element    xpath=//*[@id="back-to-products"]
    Click Product Text      ${Sauce Labs Bike Light_XPATH}
    Check Product Details    ${Sauce Labs Bike Light_Details_XPATH}    Sauce Labs Bike Light    https://www.saucedemo.com/static/media/bike-light-1200x1500.37c843b0.jpg    A red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included.    $9.99
    Click Element    xpath=//*[@id="back-to-products"]
    Click Product Text      ${Sauce Labs Bolt T-Shirt_XPATH} 
    Check Product Details    ${Sauce Labs Bolt T-Shirt_Details_XPATH}     Sauce Labs Bolt T-Shirt     https://www.saucedemo.com/static/media/bolt-shirt-1200x1500.c2599ac5.jpg    Get your testing superhero on with the Sauce Labs bolt T-shirt. From American Apparel, 100% ringspun combed cotton, heather gray with red bolt.      $15.99
    Click Element    xpath=//*[@id="back-to-products"]
    Click Product Text     ${Sauce Labs Fleece Jacket_XPATH}
    Check Product Details    ${Sauce Labs Fleece Jacket_Details_XPATH}       Sauce Labs Fleece Jacket   https://www.saucedemo.com/static/media/sauce-pullover-1200x1500.51d7ffaf.jpg       It's not every day that you come across a midweight quarter-zip fleece jacket capable of handling everything from a relaxing day outdoors to a busy day at the office.    $49.99
    Click Element    xpath=//*[@id="back-to-products"]
    Click Product Text     ${Sauce Labs Onesie_XPATH} 
    Check Product Details    ${Sauce Labs Onesie_Details_XPATH}        Sauce Labs Onesie   https://www.saucedemo.com/static/media/red-onesie-1200x1500.2ec615b2.jpg      Rib snap infant onesie for the junior automation engineer in development. Reinforced 3-snap bottom closure, two-needle hemmed sleeved and bottom won't unravel.   $7.99
    Click Element    xpath=//*[@id="back-to-products"]
    Click Product Text     ${Sauce Labs Red T-Shirt_XPATH}  
    Check Product Details    ${Sauce Labs Red T-Shirt_Details_XPATH}   Test.allTheThings() T-Shirt (Red)       https://www.saucedemo.com/static/media/red-tatt-1200x1500.30dadef4.jpg        This classic Sauce Labs t-shirt is perfect to wear when cozying up to your keyboard to automate a few tests. Super-soft and comfy ringspun combed cotton.     $15.99
    Close Browser


Test price $
    [Documentation]     Kiểm tra xem giá tiền có bắt đầu bằng bằng $
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Page Should Contain    Products
    ${price}    Get Text    css=.inventory_item_price    # Lấy văn bản của giá tiền
    Should Start With    ${price}    $    # Kiểm tra xem giá tiền có bắt đầu bằng dấu $ không
    Close Browser    # Đóng trình duyệt sau khi kiểm thử hoàn thành




#Kiểm tra tính năng tương tác với sản phẩm từ trang chính_ Thêm 
Test click add-to-cart in product "Sauce Labs Backpack"
    [Documentation]     Kiểm tra chức năng add to cart của trang chính "Sauce Labs Backpack"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Add Product To Cart _ Homepage  ${Sauce Labs Backpack_XPATH}  
    Close Browser

Test click add-to-cart in product "Sauce Labs Bike Light"
    [Documentation]       Kiểm tra chức năng add to cart của trang chính "Sauce Labs Bike Light"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Add Product To Cart _ Homepage    ${Sauce Labs Bike Light_XPATH}
    Close Browser

Test click add-to-cart in product "Sauce Labs Bolt T-Shirt"
    [Documentation]       Kiểm tra chức năng add to cart của trang chính "Sauce Labs Bolt T-Shirt"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}   
    Add Product To Cart _ Homepage    ${Sauce Labs Bolt T-Shirt_XPATH}  
    Close Browser

Test click add-to-cart in product "Sauce Labs Fleece JacketJacket"
    [Documentation]       Kiểm tra chức năng add to cart của trang chính "Sauce Labs Fleece JacketJacket"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}   
    Add Product To Cart _ Homepage    ${Sauce Labs Fleece Jacket_XPATH}
    Close Browser

Test click add-to-cart in product "Sauce Labs Onesie"
    [Documentation]       Kiểm tra chức năng add to cart của trang chính "Sauce Labs Red T-Shirt"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}    
    Add Product To Cart _ Homepage    ${Sauce Labs Onesie_XPATH}
    Close Browser

Test click add-to-cart in product "Sauce Labs Red T-Shirt"
    [Documentation]       Kiểm tra chức năng add to cart của trang chính "Sauce Labs Red T-Shirt"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}    
    Add Product To Cart _ Homepage    ${Sauce Labs Red T-Shirt_XPATH}
    Close Browser

#Kiểm tra tính năng tương tác với sản phẩm từ trang chính_ Xóa
Test click remove-to-cart in product "Sauce Labs Backpack"
    [Documentation]       Kiểm tra chức năng remove của trang chính "Sauce Labs Backpack"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Add Product To Cart _ Homepage      ${Sauce Labs Backpack_XPATH}  
    Remove Product To Cart _ Homepage     ${Sauce Labs Backpack_XPATH}  
    Close Browser

Test click remove-to-cart in product "Sauce Labs Bike Light"
    [Documentation]     Kiểm tra chức năng remove của trang chính "Sauce Labs Bike Light"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Add Product To Cart _ Homepage    ${Sauce Labs Bike Light_XPATH} 
    Remove Product To Cart _ Homepage    ${Sauce Labs Bike Light_XPATH} 
    Close Browser

Test click remove-to-cart in product "Sauce Labs Bolt T-Shirt"
    [Documentation]     Kiểm tra chức năng remove của trang chính "Sauce Labs Bolt T-Shirt"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}    
    Add Product To Cart _ Homepage    ${Sauce Labs Bolt T-Shirt_XPATH}  
    Remove Product To Cart _ Homepage    ${Sauce Labs Bolt T-Shirt_XPATH}  
    Close Browser

Test click remove-to-cart in product "Sauce Labs Onesie"
    [Documentation]     Kiểm tra chức năng remove của trang chính "Sauce Labs Onesie"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD} 
    Add Product To Cart _ Homepage     ${Sauce Labs Onesie_XPATH}
    Remove Product To Cart _ Homepage     ${Sauce Labs Onesie_XPATH}
    Close Browser

Test click remove-to-cart in product "Sauce Labs Red T-Shirt"
    [Documentation]     Kiểm tra chức năng remove của trang chính "Sauce Labs Red T-Shirt"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD} 
    Add Product To Cart _ Homepage    ${Sauce Labs Red T-Shirt_XPATH}
    Remove Product To Cart _ Homepage    ${Sauce Labs Red T-Shirt_XPATH}
    Close Browser


Test click remove-to-cart in product "Sauce Labs Fleece Jacket"
    [Documentation]     Kiểm tra chức năng remove của trang chính "Sauce Labs Fleece Jacket"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD} 
    Add Product To Cart _ Homepage    ${Sauce Labs Fleece Jacket_XPATH}
    Remove Product To Cart _ Homepage    ${Sauce Labs Fleece Jacket_XPATH}
    Close Browser

#Kiểm tra tính năng tương tác với sản phẩm từ trang ctsp_ Thêm 
Test click add-to-cart in product details "Sauce Labs Backpack"
    [Documentation]     Kiểm tra chức năng add to cart của trang chi tiết sản phẩm "Sauce Labs Backpack"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Image    ${Sauce Labs Backpack_XPATH}
    Add Product To Cart
    Close Browser

Test click add-to-cart in product details "Sauce Labs Bike Light"
    [Documentation]     Kiểm tra chức năng add to cart của trang chi tiết sản phẩm "Sauce Labs Bike Light"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Image    ${Sauce Labs Bike Light_XPATH}
    Add Product To Cart
    Close Browser

Test click add-to-cart in product details "Sauce Labs Bolt T-Shirt"
    [Documentation]     Kiểm tra chức năng add to cart của trang chi tiết sản phẩm "Sauce Labs Bolt T-Shirt"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Image    ${Sauce Labs Bolt T-Shirt_XPATH}     
    Add Product To Cart
    Close Browser

Test click add-to-cart in product details "Sauce Labs Onesie"
    [Documentation]     Kiểm tra chức năng add to cart của trang chi tiết sản phẩm "Sauce Labs Onesie"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Image    ${Sauce Labs Onesie_XPATH}     
    Add Product To Cart
    Close Browser

Test click add-to-cart in product details "Sauce Labs Red T-Shirt"
    [Documentation]     Kiểm tra chức năng add to cart của trang chi tiết sản phẩm "Sauce Labs Red T-Shirt"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Image   ${Sauce Labs Red T-Shirt_XPATH}     
    Add Product To Cart
    Close Browser

Test click add-to-cart in product details "Sauce Labs Fleece Jacket"
    [Documentation]     Kiểm tra chức năng add to cart của trang chi tiết sản phẩm "Sauce Labs Fleece Jacket"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Image       ${Sauce Labs Fleece Jacket_XPATH}    
    Add Product To Cart
    Close Browser



#Kiểm tra tính năng tương tác với sản phẩm từ trang ctsp_ Xóa
Test click remove-to-cart in product details "Sauce Labs Backpack"
    [Documentation]     Kiểm tra chức năng remove của trang chi tiết sản phẩm "Sauce Labs Backpack"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Image    ${Sauce Labs Backpack_XPATH}
    Add Product To Cart
    Remove Product To Cart
    Close Browser

Test click remove-to-cart in product details "Sauce Labs Bike Light"
    [Documentation]     Kiểm tra chức năng remove của trang chi tiết sản phẩm "Sauce Labs Bike Light"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Image    ${Sauce Labs Bike Light_XPATH}
    Add Product To Cart
    Remove Product To Cart
    Close Browser

Test click remove-to-cart in product details "Sauce Labs Bolt T-Shirt"
    [Documentation]     Kiểm tra chức năng remove của trang chi tiết sản phẩm "Sauce Labs Bolt T-Shirt"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Image    ${Sauce Labs Bolt T-Shirt_XPATH}     
    Add Product To Cart
    Remove Product To Cart
    Close Browser

Test click remove-to-cart in product details "Sauce Labs Onesie"
    [Documentation]     Kiểm tra chức năng remove của trang chi tiết sản phẩm "Sauce Labs Onesie"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Image    ${Sauce Labs Onesie_XPATH}     
    Add Product To Cart
    Remove Product To Cart
    Close Browser

Test click remove-to-cart in product details "Sauce Labs Red T-Shirt"
    [Documentation]     Kiểm tra chức năng remove của trang chi tiết sản phẩm "Sauce Labs Red T-Shirt"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Image   ${Sauce Labs Red T-Shirt_XPATH}     
    Add Product To Cart
    Remove Product To Cart
    Close Browser

Test click remove-to-cart in product details "Sauce Labs Fleece Jacket"
    [Documentation]     Kiểm tra chức năng remove của trang chi tiết sản phẩm "Sauce Labs Fleece Jacket"
    Login To Website    ${URL}    ${BROWSER}    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Product Image   ${Sauce Labs Fleece Jacket_XPATH}       
    Add Product To Cart
    Remove Product To Cart
    Close Browser
 
#Kiểm tra chức năng của các nút "Add to cart" nhiều sản phẩm
Check Add to Cart Buttons Functionality
    [Documentation]    Kiểm tra chức năng của các nút "Add to cart"
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button
    Page Should Contain    Products
    @{add_to_cart_buttons} =    Get Web Elements    xpath://button[contains(@class, 'btn_inventory')]    # Lấy danh sách các nút "Add to cart"
    FOR    ${button}    IN    @{add_to_cart_buttons}
        Click Element    ${button}
        Sleep    3s    # Đợi cho phần tử được thêm vào giỏ hàng (có thể cần điều chỉnh thời gian chờ tùy theo hiệu suất trang web)
    END
    Sleep    5S

*** Keywords ***
Login To Website
    [Arguments]    ${url}    ${browser}    ${username}    ${password}
    Open Browser    ${url}    ${browser}
    Input Text    css=#user-name    ${username}
    Input Password    css=#password    ${password}
    Click Button    css=#login-button
    
Check Product 
    [Arguments]    ${xpath}    ${expected_name}    ${expected_image_src}    ${expected_description}    ${expected_price}
    ${actual_image_src}=    Get Element Attribute    xpath=${xpath}//img    src
    Run Keyword And Continue On Failure   Should Be Equal As Strings    ${actual_image_src}    ${expected_image_src}    msg=Product image does not match 
    ${actual_product_name}=    Get Text    xpath=${xpath}//div[contains(@class, 'inventory_item_name')]
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${actual_product_name}    ${expected_name}    msg=Product name does not match
    ${actual_product_description}=    Get Text    xpath=${xpath}//div[@class='inventory_item_desc']
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${actual_product_description}    ${expected_description}    msg=Product description does not match
    ${actual_product_price}=    Get Text    xpath=${xpath}//div[@class='inventory_item_price']
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${actual_product_price}    ${expected_price}    msg=Product price does not match

Check Product Details
    [Arguments]    ${xpath}    ${expected_name}    ${expected_image_src}    ${expected_description}    ${expected_price}
    ${actual_image_src}=    Get Element Attribute    xpath=${xpath}//img    src
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${actual_image_src}    ${expected_image_src}    msg=Product image does not match
    ${actual_product_name}=    Get Text    xpath=${xpath}//div[contains(@class, 'inventory_details_name large_size')]
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${actual_product_name}    ${expected_name}    msg=Product name does not match
    ${actual_product_description}=    Get Text    xpath=${xpath}//div[@class='inventory_details_desc large_size']
    Run Keyword And Continue On Failure     Should Be Equal As Strings    ${actual_product_description}    ${expected_description}    msg=Product description does not match
    ${actual_product_price}=    Get Text    xpath=${xpath}//div[@class='inventory_details_price']
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${actual_product_price}    ${expected_price}    msg=Product price does not match


Click Product Image
    [Arguments]    ${xpath}
    Wait Until Element Is Visible    xpath=${xpath}//img
    Click Element    xpath=${xpath}//img

Click Product Text
    [Arguments]    ${xpath}
    Wait Until Element Is Visible   xpath=${xpath}//div[contains(@class, 'inventory_item_name')]
    Click Element    xpath=${xpath}//div[contains(@class, 'inventory_item_name')]


Add Product To Cart
    Wait Until Element Is Visible    xpath=//*[@id="add-to-cart"]
    Click Button    //*[@id="add-to-cart"]
    Get Cart Quantity

Add Product To Cart _ Homepage
    [Arguments]    ${xpath}
    Wait Until Element Is Visible    xpath=${xpath}//button[contains(@class, 'btn_primary')]
    Click Button    xpath=${xpath}//button[contains(@class, 'btn_primary')]
    Get Cart Quantity

Remove Product To Cart _ Homepage    
    [Arguments]    ${xpath} 
    Wait Until Element Is Visible    xpath=${xpath}//button[contains(@class, 'btn_secondary')]
    Click Button    xpath=${xpath}//button[contains(@class, 'btn_secondary')]
    Get Cart Quantity_Remove 

    


Remove Product To Cart
    Wait Until Element Is Visible    xpath=//*[@id="remove"]
    Click Button   //*[@id="remove"]
    Get Cart Quantity_Remove

Get Cart Quantity
    [Documentation]    Lấy số lượng sản phẩm trong giỏ hàng
    ${cart_quantity_before}=    Get Text   ${CartQuantity_CSS}
    Run Keyword If    '${cart_quantity_before}' >= '1'
    ...    Log    Số lượng sản phẩm trong giỏ hàng: ${cart_quantity_before}. Thêm thành công 
    ...    ELSE
    ...    Fail     giỏ hàng trống 

Get Cart Quantity_Remove
    ${is_cart_quantity_css_exist}=    Run Keyword And Return Status    Element Should Not Be Visible    ${CartQuantity_CSS}
    Run Keyword If    '${is_cart_quantity_css_exist}' == 'FAIL'
    ...    Fail   Xóa thành công sản phẩm khỏi giỏ hàng
    ...    ELSE
    ...    Log     Xóa sản phẩm khỏi giỏ hàng thất bại


#30 tests, 29 passed, 1 failed