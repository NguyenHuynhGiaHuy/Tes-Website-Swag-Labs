*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com/
${EXPECTED_URL}     https://www.example.com/dashboard
${VALID_USERNAME}    standard_user
${VALID_PASSWORD}    secret_sauce
${INVALID_USERNAME}    invalid_user
${INVALID_PASSWORD}    invalid_password
${WHITESPACE_USERNAME}  standard_user 
${WHITESPACE_PASSWORD}    secret_sauce
${BROWSER 2}        Edge
${USERNAME 2}       standard_user
${PASSWORD 2}       secret_sauce
${EXPECTED_ERROR_MESSAGE}    Epic sadface: Username and password do not match any user in this service
${SPECIAL_CHARACTER}    @
${UNICODE_USERNAME}     ©
${UNICODE_PASSWORD}     €
${CASE_INSENSITIVE_USERNAME}    ${VALID_USERNAME.lower()}    # Chuyển đổi tên người dùng thành chuỗi không phân biệt chữ hoa chữ thường
${CASE_INSENSITIVE_PASSWORD}    ${VALID_PASSWORD.upper()}    # Chuyển đổi mật khẩu thành chuỗi không phân biệt chữ hoa chữ thường
${BROWSERS}    Chrome    Firefox    Edge    Safari  


*** Test Cases ***
Login with Valid Credentials
    [Documentation]    Đăng nhập bằng thông tin đăng nhập hợp lệ
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button    # Nhấn vào nút đăng nhập
    Wait Until Page Contains Element    css=.inventory_list    # Chờ đợi cho đến khi trang hiển thị danh sách sản phẩm
    Location Should Be    ${URL}inventory.html    # Kiểm tra xem URL có phải là "${URL}inventory.html" không
    [Teardown]    Close All Browsers

Login with Invalid Credentials
    [Documentation]    Đăng nhập bằng thông tin đăng nhập không hợp lệ
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${INVALID_USERNAME}    # Nhập tên người dùng không hợp lệ vào trường "user-name"
    Input Password    css=#password    ${INVALID_PASSWORD}    # Nhập mật khẩu không hợp lệ vào trường "password"
    Click Button    css=#login-button    # Nhấn vào nút đăng nhập
    Wait Until Page Contains Element    css=.error-button    # Chờ đợi cho đến khi trang hiển thị nút lỗi
    ${error_message}=    Get Text    css=.error-message-container > h3    # Lấy văn bản của thông báo lỗi
    Should Be Equal    ${error_message}    ${EXPECTED_ERROR_MESSAGE}    # So sánh thông báo lỗi với thông báo mong đợi
    [Teardown]    Close All Browsers

Login with Empty Username
    [Documentation]    Đăng nhập khi chỉ tên người dùng bị bỏ trống
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${EMPTY}    # Nhập tên người dùng trống vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Click Button    css=#login-button    # Nhấn vào nút đăng nhập
    Wait Until Page Contains Element    css=.error-button    # Chờ đợi cho đến khi trang hiển thị nút lỗi
    ${error_message}=    Get Text    css=.error-message-container > h3    # Lấy văn bản của thông báo lỗi
    Should Be Equal    ${error_message}    Epic sadface: Username is required    # So sánh thông báo lỗi với thông báo mong đợi
    [Teardown]    Close All Browsers

Login with Special Characters in Username
    [Documentation]    Đăng nhập với tên người dùng chứa ký tự đặc biệt
    Open Browser    ${URL}    ${BROWSER}
    ${username_with_special_character}=    Evaluate    "${SPECIAL_CHARACTER}${VALID_USERNAME}"    # Thêm ký tự đặc biệt vào trước tên người dùng
    Input Text    css=#user-name    ${username_with_special_character}
    Input Password    css=#password    ${VALID_PASSWORD}
    Click Button    css=#login-button    # Nhấn vào nút đăng nhập
    Wait Until Page Contains Element    css=.error-button    # Chờ đợi cho đến khi trang hiển thị nút lỗi
    ${error_message}=    Get Text    css=.error-message-container > h3    # Lấy văn bản của thông báo lỗi
    Should Be Equal    ${error_message}    ${EXPECTED_ERROR_MESSAGE}    # So sánh thông báo lỗi với thông báo mong đợi
    [Teardown]    Close All Browsers

Login with Special Characters in Password
    [Documentation]    Đăng nhập với mật khẩu chứa ký tự đặc biệt
    Open Browser    ${URL}    ${BROWSER}
    Input Text    css=#user-name    ${VALID_USERNAME}
    ${password_with_special_character}=    Set Variable    ${SPECIAL_CHARACTER}${VALID_PASSWORD}    # Thêm ký tự đặc biệt vào trước mật khẩu
    Input Password    css=#password    ${password_with_special_character}
    Click Button    css=#login-button    # Nhấn vào nút đăng nhập
    Wait Until Page Contains Element    css=.error-button    # Chờ đợi cho đến khi trang hiển thị nút lỗi
    ${error_message}=    Get Text    css=.error-message-container > h3    # Lấy văn bản của thông báo lỗi
    Should Be Equal    ${error_message}    ${EXPECTED_ERROR_MESSAGE}    # So sánh thông báo lỗi với thông báo mong đợi
    [Teardown]    Close All Browsers

Login with Unicode Credentials
    [Documentation]    Đăng nhập với tên người dùng và mật khẩu có ký tự Unicode
    Open Browser    ${URL}    ${BROWSER}
    Input Text    css=#user-name    ${UNICODE_USERNAME}${VALID_USERNAME}    # Thêm ký tự Unicode vào trước tên người dùng
    Input Password    css=#password    ${UNICODE_PASSWORD}${VALID_PASSWORD}    # Thêm ký tự Unicode vào trước mật khẩu
    Click Button    css=#login-button    # Nhấn vào nút đăng nhập
    Wait Until Page Contains Element    css=.error-button    # Chờ đợi cho đến khi trang hiển thị nút lỗi
    ${error_message}=    Get Text    css=.error-message-container > h3    # Lấy văn bản của thông báo lỗi
    Should Be Equal    ${error_message}    ${EXPECTED_ERROR_MESSAGE}    # So sánh thông báo lỗi với thông báo mong đợi
    [Teardown]    Close All Browsers

Login with Case Insensitive Credentials
    [Documentation]    Đăng nhập với tên người dùng và mật khẩu chứa cả ký tự in hoa và in thường không phân biệt
    Open Browser    ${URL}    ${BROWSER}
    Input Text    css=#user-name    ${CASE_INSENSITIVE_USERNAME}    # Sử dụng tên người dùng không phân biệt chữ hoa chữ thường
    Input Password    css=#password    ${CASE_INSENSITIVE_PASSWORD}    # Sử dụng mật khẩu không phân biệt chữ hoa chữ thường
    Click Button    css=#login-button    # Nhấn vào nút đăng nhập
    Wait Until Page Contains Element    css=.error-button    # Chờ đợi cho đến khi trang hiển thị nút lỗi
    ${error_message}=    Get Text    css=.error-message-container > h3    # Lấy văn bản của thông báo lỗi
    Should Be Equal    ${error_message}    ${EXPECTED_ERROR_MESSAGE}    # So sánh thông báo lỗi với thông báo mong đợi
    [Teardown]    Close All Browsers

Login with Leading or Trailing Whitespace Credentials
    [Documentation]    Đăng nhập với tên người dùng và mật khẩu có ký tự trắng ở đầu hoặc cuối
    Open Browser    ${URL}    ${BROWSER}
    ${username_with_whitespace}=    Evaluate    " ${WHITESPACE_USERNAME}"    # Thêm khoảng trắng vào trước tên người dùng
    Input Text    css=#user-name    ${username_with_whitespace}
    Input Password    css=#password    ${WHITESPACE_PASSWORD}
    Click Button    css=#login-button    # Nhấn vào nút đăng nhập
    Wait Until Page Contains Element    css=.error-button    # Chờ đợi cho đến khi trang hiển thị nút lỗi
    ${error_message}=    Get Text    css=.error-message-container > h3    # Lấy văn bản của thông báo lỗi
    Should Be Equal    ${error_message}    ${EXPECTED_ERROR_MESSAGE}    # So sánh thông báo lỗi với thông báo mong đợi
    [Teardown]    Close All Browsers

Login with Matching Username and Password
    [Documentation]    Đăng nhập với tên người dùng và mật khẩu trùng nhau
    Open Browser    ${URL}    ${BROWSER}
    Input Text    css=#user-name    ${VALID_USERNAME} 
    Input Password    css=#password    ${VALID_USERNAME} 
    Click Button    css=#login-button    # Nhấn vào nút đăng nhập
    Wait Until Page Contains Element    css=.error-button    # Chờ đợi cho đến khi trang hiển thị nút lỗi
    ${error_message}=    Get Text    css=.error-message-container > h3    # Lấy văn bản của thông báo lỗi
    Should Be Equal    ${error_message}    ${EXPECTED_ERROR_MESSAGE}    # So sánh thông báo lỗi với thông báo mong đợi
    [Teardown]    Close All Browsers


Login with Long Credentials
    [Documentation]    Đăng nhập với tên người dùng và mật khẩu dài hơn giới hạn
    ${long_username}=    Evaluate    "${VALID_USERNAME}" + "_with_long_username"
    ${long_password}=    Evaluate    "${VALID_PASSWORD}" + "_with_long_password"
    Open Browser    ${URL}    ${BROWSER}
    Input Text    css=#user-name    ${long_username}
    Input Password    css=#password    ${long_password}
    Click Button    css=#login-button
    Wait Until Page Contains Element    css=.error-button
    ${error_message}=    Get Text    css=.error-message-container > h3
    Should Be Equal    ${error_message}    ${EXPECTED_ERROR_MESSAGE}
    [Teardown]    Close All Browsers

Login with Numeric Prefix
    [Documentation]    Đăng nhập bằng tên người dùng và mật khẩu có ký tự số ở đầu
    ${numeric_username}=    Set Variable    123${VALID_USERNAME}
    ${numeric_password}=    Set Variable    456_${VALID_PASSWORD}
    Open Browser    ${URL}    ${BROWSER}
    Input Text    css=#user-name    ${numeric_username}
    Input Password    css=#password    ${numeric_password}
    Click Button    css=#login-button
    Wait Until Page Contains Element    css=.error-button
    ${error_message}=    Get Text    css=.error-message-container > h3
    Should Be Equal    ${error_message}    ${EXPECTED_ERROR_MESSAGE}
    [Teardown]    Close All Browsers

Login with Social Media Account
    [Documentation]    Đăng nhập bằng tài khoản mạng xã hội
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Click Button    css=#social-media-login-facebook    # Click vào nút đăng nhập bằng Facebook
    [Teardown]    Close All Browsers

Secure Login Communication
    [Documentation]    Đảm bảo rằng thông tin đăng nhập không được lộ ra ngoài
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL bằng giao thức HTTPS
    # Tiếp tục với các bước nhập thông tin đăng nhập và đăng nhập
    # Sau khi đăng nhập thành công, kiểm tra xem URL có sử dụng giao thức HTTPS không
    ${current_url}=    Get Location
    Should Start With    ${current_url}    https://    # Kiểm tra xem URL có bắt đầu bằng "https://" không
    [Teardown]    Close All Browsers

Remember Login Feature
    [Documentation]    Kiểm tra tính năng ghi nhớ đăng nhập
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    # Kiểm tra xem có ô checkbox "Ghi nhớ đăng nhập" không và chọn nó nếu có
    ${remember_checkbox}=    Page Should Contain Element    id=remember-checkbox
    Run Keyword If    '${remember_checkbox}' != 'None'    Click Element    id=remember-checkbox
    Click Button    id=login-button    # Nhấn vào nút đăng nhập
    # Đăng xuất khỏi tài khoản
    # Bật lại trình duyệt và kiểm tra xem liệu thông tin đăng nhập có được tự động điền vào form không
    Close Browser    # Đóng trình duyệt
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    # Kiểm tra xem ô nhập tên người dùng có được tự động điền thông tin không
    ${username_field_value}=    Get Value    id=username
    Should Be Equal As Strings    ${username_field_value}   ${VALID_USERNAME}    # So sánh giá trị tự động điền với giá trị tên người dùng đã đăng nhập trước đó
    [Teardown]    Close All Browsers

Test the feature to close informative error messages after input errors
    [Documentation]    Kiểm tra tính năng đóng thông báo lỗi thông tin sau khi nhập lỗi
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${INVALID_USERNAME}    # Nhập tên người dùng không hợp lệ vào trường "user-name"
    Input Password    css=#password    ${INVALID_PASSWORD}    # Nhập mật khẩu không hợp lệ vào trường "password"
    Click Button    css=#login-button    # Nhấn vào nút đăng nhập
    Wait Until Page Contains Element    css=.error-button    # Chờ đợi cho đến khi trang hiển thị nút lỗi
    Click Button      //*[@id="login_button_container"]/div/form/div[3]/h3/button
     ${element_visible}    Run Keyword And Return Status    Element Should Not Be Visible    //*[@id="login_button_container"]/div/form/div[3]/h3/button
    Run Keyword If    '${element_visible}' == 'True'
    ...    Log     Đóng thành công
    ...    ELSE
    ...    Fail     Đóng thất bại
    [Teardown]    Close All Browsers

Check Content and Color of SVG Icon
    [Documentation]    Kiểm tra nội dung và màu của icon "X"
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${INVALID_USERNAME}    # Nhập tên người dùng không hợp lệ vào trường "user-name"
    Input Password    css=#password    ${INVALID_PASSWORD}    # Nhập mật khẩu không hợp lệ vào trường "password"
    Click Button    css=#login-button    # Nhấn vào nút đăng nhập
    Wait Until Page Contains Element    css=.error-button    # Chờ đợi cho đến khi trang hiển thị nút lỗi
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
    Sleep   1s
    ${result1} =    Execute Javascript    ${script1}
    ${result2} =    Execute Javascript    ${script2}
    ${result3} =    Execute Javascript    ${script3}
    Should Be Equal As Strings    ${result1}[0]    rgb(226, 35, 26)
    Should Be Equal As Strings    ${result2}[0]    rgb(226, 35, 26)
    Should Be Equal As Strings    ${result3}[0]    rgb(255, 255, 255)
    Should Be Equal As Strings    ${result1}[1]    times-circle
    Should Be Equal As Strings    ${result2}[1]    times-circle
    Should Be Equal As Strings    ${result3}[1]    times
    [Teardown]    Close All Browsers

Check the text input instructions
    [Documentation]    Kiểm tra văn bản hướng dẫn nhập văn bản
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    ${Username_placeholder}    Execute Javascript    return document.querySelector('input[placeholder="Username"]').getAttribute('placeholder')
    ${Password_placeholder}    Execute Javascript    return document.querySelector('input[placeholder="Password"]').getAttribute('placeholder')
    Run Keyword If    '${Username_placeholder}' == 'Username' and '${Password_placeholder}' == 'Password' 
    ...    Log     Placeholder texts are correct
    ...    ELSE
    ...    Fail    Placeholder texts are not correct
    [Teardown]    Close All Browsers

Check Cursor Position After Page Load
    [Documentation]    Kiểm tra vị trí của con trỏ sau khi trang được tải
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    ${cursor_position}=    Execute JavaScript    return document.activeElement.tagName    # Lấy tagName của phần tử đang được focus
    Run Keyword If    '${cursor_position}' != 'BODY'    Log    Con trỏ ở vị trí khác như dự kiến    # Kiểm tra xem con trỏ có đang ở vị trí mong đợi không
    ...    ELSE    Log    Con trỏ đang ở vị trí mong đợi    # Log thông báo nếu con trỏ đang ở vị trí mong đợi

Login with Enter Key
    [Documentation]    Kiểm tra xem phím Enter có hoạt động thay thế cho nút đăng nhập không
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Press Keys    css=#user-name    ENTER 
    Wait Until Page Contains Element    css=.inventory_list    # Chờ đợi cho đến khi trang hiển thị danh sách sản phẩm
    Location Should Be    ${URL}inventory.html    # Kiểm tra xem URL có phải là "${URL}inventory.html" không
    [Teardown]    Close All Browsers

Check Username and Password Fields Order
    [Documentation]    Kiểm tra xem trường "Tên người dùng" và "Mật khẩu" có xuất hiện theo thứ tự không
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    ${username_index}=    Execute JavaScript    return Array.from(document.querySelectorAll('input')).findIndex(element => element.getAttribute('id') === 'user-name')
    ${password_index}=    Execute JavaScript    return Array.from(document.querySelectorAll('input')).findIndex(element => element.getAttribute('id') === 'password')
    Run Keyword If    ${username_index} < ${password_index}
    ...    Log    Trường "Tên người dùng" xuất hiện trước trường "Mật khẩu"
    ...    ELSE IF    ${username_index} > ${password_index}
    ...    Fail    Trường "Mật khẩu" xuất hiện trước trường "Tên người dùng"
    ...    ELSE
    ...    Fail    Không thể xác định thứ tự của các trường
    [Teardown]    Close All Browsers

Check Signup Link Presence
    [Documentation]    Kiểm tra xem trang đăng nhập có chứa liên kết đến trang đăng ký cho người dùng mới không
    Open Browser    ${URL}    ${BROWSER}    # Mở trình duyệt và truy cập vào URL
    ${signup_link_visible}=    Run Keyword And Return Status    Page Should Contain Element    css=a[href='/register.html']    # Kiểm tra xem liên kết đăng ký có hiển thị trên trang không
    Run Keyword If    ${signup_link_visible}    Log    Trang đăng nhập có chứa liên kết đến trang đăng ký cho người dùng mới
    ...    ELSE    Fail    Trang đăng nhập không chứa liên kết đến trang đăng ký cho người dùng mới
    [Teardown]    Close All Browsers

Test Copy and Paste Password
    [Documentation]    Kiểm tra khả năng sao chép và dán mật khẩu từ trường văn bản
    Open Browser    ${URL}    ${BROWSER}
    Input Text    css=#user-name    ${VALID_USERNAME}
    Input Password    css=#password    ${VALID_PASSWORD}
    Press Keys    id=password    TAB
    Press Keys    id=password    CTRL+A  CTRL+C  DELETE
    Sleep   2s 
    Press Keys    id=password    CTRL+V
    Press Keys    id=password    ENTER 
    Wait Until Page Contains Element    css=.inventory_list    # Chờ đợi cho đến khi trang hiển thị danh sách sản phẩm
    Location Should Be    ${URL}inventory.html    # Kiểm tra xem URL có phải là "${URL}inventory.html" không

Test Decode Hidden Characters
    [Documentation]    Kiểm tra khả năng giải mã ký tự bị che
    Open Browser    ${URL}    ${BROWSER}
    Input Text    css=#user-name    ${VALID_USERNAME}
    Input Password    css=#password    ${VALID_PASSWORD}
    Press Keys    id=password    CTRL+A  CTRL+C  
    Press Keys    css=#password    SHIFT+TAB    CTRL+V
    ${password_value}=    Get Value    css=#user-name    # Lấy giá trị của trường mật khẩu từ thuộc tính 'value'
    Run Keyword If    '${password_value}' != '${VALID_PASSWORD}'    Log    Không có khả năng giải mã ký tự bị che
    ...    ELSE    Fail    Có khả năng giải mã ký tự bị che
    [Teardown]    Close All Browsers

Test Form Security Information
    [Documentation]    Kiểm tra xem biểu mẫu có cung cấp thông tin bảo mật nếu nguồn được xem không
    Open Browser    ${URL}    ${BROWSER}
    ${autocomplete_attribute}=    Get Element Attribute    css=#login-form    autocomplete    # Lấy giá trị của thuộc tính 'autocomplete' của biểu mẫu
    Run Keyword If    '${autocomplete_attribute}' == 'off'    Log    Biểu mẫu cung cấp thông tin bảo mật nếu nguồn được xem
    ...    ELSE    Fail    Biểu mẫu không cung cấp thông tin bảo mật nếu nguồn được xem
    [Teardown]    Close All Browsers

Test SQL Injection Vulnerability
    [Documentation]    Kiểm tra xem biểu mẫu có dễ bị tấn công bởi SQL Injection không
    Open Browser    ${URL}    ${BROWSER}
    ${sql_injection_attempt}=    Run Keyword And Return Status    Input Text    css=#username    ' OR 1=1 --'
    Run Keyword If    '${sql_injection_attempt}' == 'True'    Fail    Biểu mẫu dễ bị tấn công bởi SQL Injection
    ...    ELSE    Log    Không phát hiện dấu hiệu của SQL Injection
    [Teardown]    Close All Browsers

Test Access Without Login
    [Documentation]    Kiểm tra xem biểu mẫu có cho phép truy cập trang mà không cần đăng nhập không
    Open Browser    ${URL}    ${BROWSER}
    ${login_required}=    Run Keyword And Return Status    Element Should Be Visible    css=.login-button
    Run Keyword If    '${login_required}' == 'True'    Fail    Biểu mẫu yêu cầu đăng nhập để truy cập
    ...    ELSE    Log    Biểu mẫu cho phép truy cập trang mà không cần đăng nhập
    [Teardown]    Close All Browsers

Test Member Area Access
    [Documentation]    Kiểm tra xem thao tác URL có cho phép truy cập vào khu vực thư chỉ dành cho thành viên không
    Open Browser    ${URL}/member-area    ${BROWSER}
    ${login_required}=    Run Keyword And Return Status    Element Should Be Visible    css=.login-button
    Run Keyword If    '${login_required}' == 'True'    Fail    Thao tác URL yêu cầu đăng nhập để truy cập vào khu vực thành viên
    ...    ELSE    Log    Thao tác URL cho phép truy cập vào khu vực thành viên mà không cần đăng nhập
    [Teardown]    Close All Browsers

Test Multiple Accounts from Same IP
    [Documentation]    Kiểm tra xem có cho phép nhiều tài khoản từ cùng một IP nhưng trình duyệt khác nhau không
    Open Browser    ${URL}    ${BROWSER}
    Input Text    css=#user-name    ${VALID_USERNAME}
    Input Password    css=#password    ${VALID_PASSWORD}
    Click Button    css=#login-button
    Close Browser
    Open Browser    ${URL}    ${BROWSER 2}
    Input Text    css=#user-name    ${USERNAME 2}
    Input Password    css=#password    ${PASSWORD 2}
    Click Button    css=#login-button
    ${login_success_2}=    Run Keyword And Return Status    Element Should Be Visible    css=.inventory_list
    Run Keyword If    '${login_success_2}' == 'True'    Log    Đã đăng nhập thành công với tài khoản thứ hai từ cùng một IP
    ...    ELSE    Fail    Không thể đăng nhập với tài khoản thứ hai từ cùng một IP
    [Teardown]    Close All Browsers

Test Cookie Policy
    [Documentation]    Kiểm tra chính sách cookie của trang web
    Open Browser    ${URL}    ${BROWSER}
    ${cookie_policy_link}=    Get Element Attribute    css=a#cookie-policy    href    # Lấy liên kết đến trang chính sách cookie
    Click Link    ${cookie_policy_link}    # Click vào liên kết chính sách cookie
    ${cookie_banner}=    Wait Until Element Is Visible    css=.cookie-banner    timeout=10s    # Chờ cho banner cookie xuất hiện
    Run Keyword If    '${cookie_banner}' == 'True'
    ...    Log    Banner cookie hiển thị đúng như mong đợi
    ...    ELSE    Fail    Banner cookie không hiển thị
    ${cookie_policy_text}=    Get Text    css=.cookie-policy-content    # Lấy nội dung của trang chính sách cookie
    Should Contain    ${cookie_policy_text}    This website uses cookies to ensure you get the best experience on our website.    # Kiểm tra xem nội dung chính sách cookie có chứa thông điệp mong đợi không
    [Teardown]    Close All Browsers

Test Form Compatibility on Chrome
    [Documentation]    Kiểm tra tính tương thích của biểu mẫu trên trình duyệt Chrome
    Open Browser    ${URL}    Chrome
    # Thêm các bước kiểm tra tính tương thích của biểu mẫu trên trình duyệt Chrome
    Close Browser

Test Form Compatibility on Firefox
    [Documentation]    Kiểm tra tính tương thích của biểu mẫu trên trình duyệt Firefox
    Open Browser    ${URL}    Firefox
    # Thêm các bước kiểm tra tính tương thích của biểu mẫu trên trình duyệt Firefox
    Close Browser

Test Form Compatibility on Edge
    [Documentation]    Kiểm tra tính tương thích của biểu mẫu trên trình duyệt Edge
    Open Browser    ${URL}    Edge
    # Thêm các bước kiểm tra tính tương thích của biểu mẫu trên trình duyệt Edge
    Close Browser

Test Form Compatibility on Safari
    [Documentation]    Kiểm tra tính tương thích của biểu mẫu trên trình duyệt Safari
    Open Browser    ${URL}    Safari
    # Thêm các bước kiểm tra tính tương thích của biểu mẫu trên trình duyệt Safari
    Close Browser

TestTabOrder 
    [Documentation]    Kiểm tra thứ tự di chuyển trỏ trên màn hình khi nhấn phím Tab và phím Enter 
    Open Browser    ${URL}    ${BROWSER}
    # Kiểm tra thứ tự khi nhấn Tab
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Press Keys    css=#user-name    TAB    # Nhấn Tab ở trường tên người dùng
    ${focused_element}    Execute Javascript    return document.activeElement.id    # Lấy id của phần tử đang được focus
    Should Be Equal    ${focused_element}    password    # Kiểm tra xem trường mật khẩu có được focus không sau khi nhấn Tab từ trường tên người dùng
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Press Keys    css=#password    ENTER   # Nhấn Enter ở trường mật khẩu
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory.html    # Kiểm tra xem URL có chuyển đến trang tiếp theo sau khi nhấn Enter không
    [Teardown]    Close All Browsers

TestShiftTabOrder 
    [Documentation]    Kiểm tra thứ tự con trỏ di chuyển ngược lại trên màn hình khi nhấn shift-Tab 
    Open Browser    ${URL}    ${BROWSER}
    Input Password    css=#password    ${VALID_PASSWORD}    # Nhập mật khẩu hợp lệ vào trường "password"
    Press Keys    css=#password    SHIFT+TAB    # Nhấn shift-Tab ở trường mật khẩu
    ${focused_element}    Execute Javascript    return document.activeElement.id    # Lấy id của phần tử đang được focus
    Should Be Equal    ${focused_element}    user-name    # Kiểm tra xem trường tên người dùng có được focus không sau khi nhấn shift-Tab từ trường mật khẩu
    Input Text    css=#user-name    ${VALID_USERNAME}    # Nhập tên người dùng hợp lệ vào trường "user-name"
    Press Keys    css=#user-name    ENTER   # Nhấn Enter ở trường tên người dùng
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory.html    # Kiểm tra xem URL có chuyển đến trang tiếp theo sau khi nhấn Enter không
    [Teardown]    Close All Browsers
