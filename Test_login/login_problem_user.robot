*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${BROWSER}               Chrome
${URL}                   https://www.saucedemo.com/
${VALID_USERNAME}    problem_user
${VALID_PASSWORD}    secret_sauce
${INVALID_USERNAME}    invalid_user
${INVALID_PASSWORD}    invalid_password
${VALID_PASSWORD}        secret_sauce
${PROBLEM_USER_USERNAME}  problem_user
${STANDARD_USER_USERNAME}  standard_user
@{PROBLEM_IMAGES}        # Danh sách rỗng để lưu trữ các hình ảnh của người dùng problem
@{STANDARD_IMAGES}       # Danh sách rỗng để lưu trữ các hình ảnh của người dùng standard
${WHITESPACE_USERNAME}  standard_user 
${WHITESPACE_PASSWORD}    secret_sauce
${EXPECTED_ERROR_MESSAGE}    Epic sadface: Username and password do not match any user in this service
${SPECIAL_CHARACTER}    @
${UNICODE_USERNAME}     ©
${UNICODE_PASSWORD}     €
${CASE_INSENSITIVE_USERNAME}    ${VALID_USERNAME.lower()}    # Chuyển đổi tên người dùng thành chuỗi không phân biệt chữ hoa chữ thường
${CASE_INSENSITIVE_PASSWORD}    ${VALID_PASSWORD.upper()}    # Chuyển đổi mật khẩu thành chuỗi không phân biệt chữ hoa chữ thường


*** Test Cases ***
Check Interface for Problem User
    [Documentation]     Kiểm tra giao diện khi đăng nhập bằng tên người dùng problem_user
    Open Browser    ${URL}    ${BROWSER}
    Login    ${PROBLEM_USER_USERNAME}    ${VALID_PASSWORD}
    Check Item Images    problem_user
    [Teardown]    Close All Browsers

Check Interface for Standard User
    [Documentation]   Kiểm tra giao diện khi đăng nhập bằng tên người dùng standard_user
    Open Browser    ${URL}    ${BROWSER}
    Login    ${STANDARD_USER_USERNAME}    ${VALID_PASSWORD}
    Check Item Images    standard_user
    [Teardown]    Close All Browsers

Compare Images Between Users
    [Documentation]   So sánh hình ảnh giữa standard_user và problem_user
    Run Keyword And Continue On Failure    Log      Đang so sánh hình ảnh giữa standard_user và problem_user
    Compare Lists    ${STANDARD_IMAGES}    ${PROBLEM_IMAGES}
    [Teardown]    Close All Browsers

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Input Text    css=#user-name    ${username}    # Nhập tên người dùng vào ô tên đăng nhập
    Input Password    css=#password    ${password}    # Nhập mật khẩu vào ô mật khẩu
    Click Button    css=#login-button    # Click vào nút đăng nhập
    Wait Until Page Contains Element    css=.inventory_list    # Chờ đến khi trang chứa danh sách sản phẩm được tải

Check Item Images
    [Arguments]    ${user_role}
    ${image_elements} =    Get WebElements    css=.inventory_item_img    # Thu thập tất cả các phần tử hình ảnh trên trang
    FOR    ${element}    IN    @{image_elements}
        ${src} =    Get Element Attribute    ${element}    src    # Lấy đường dẫn của từng hình ảnh
        Run Keyword If    '${user_role}' == 'problem_user'    Append To List    ${PROBLEM_IMAGES}    ${src}    ELSE    Append To List    ${STANDARD_IMAGES}    ${src}    # Thêm đường dẫn vào danh sách tương ứng dựa trên vai trò của người dùng
    END

Compare Lists
    [Arguments]    ${list1}    ${list2}
    [Documentation]    So sánh hai danh sách hình ảnh và in ra kết quả
    ${are_equal} =    Evaluate    ${list1} == ${list2}
    Run Keyword If    not ${are_equal}    Fail    Các hình ảnh của item sản phẩm giữa hai người dùng không khớp nhau.
