*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${BROWSER}               Chrome
${URL}                   https://www.saucedemo.com/
${VALID_PASSWORD}        secret_sauce
${VISUAL_USER_USERNAME}  visual_user
${STANDARD_USER_USERNAME}  standard_user
@{VISUA_IMAGES}        # Danh sách rỗng để lưu trữ các hình ảnh của người dùng visual
@{STANDARD_IMAGES}       # Danh sách rỗng để lưu trữ các hình ảnh của người dùng standard


*** Test Cases ***
Check Interface for Visual User
    [Documentation]     Kiểm tra giao diện khi đăng nhập bằng tên người dùng visual_user
    Open Browser    ${URL}    ${BROWSER}
    Login   ${VISUAL_USER_USERNAME}   ${VALID_PASSWORD}
    Check Item Images   visual_user
    [Teardown]    Close All Browsers

Check Interface for Standard User
    [Documentation]   Kiểm tra giao diện khi đăng nhập bằng tên người dùng standard_user
    Open Browser    ${URL}    ${BROWSER}
    Login    ${STANDARD_USER_USERNAME}    ${VALID_PASSWORD}
    Check Item Images    standard_user
    [Teardown]    Close All Browsers

Compare Images Between Users
    [Documentation]   So sánh hình ảnh giữa standard_user và visual_user
    Run Keyword And Continue On Failure    Log      Đang so sánh hình ảnh giữa standard_user và visual_user
    Compare Lists    ${STANDARD_IMAGES}    ${VISUA_IMAGES} 
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
        Run Keyword If    '${user_role}' == 'visual_user'    Append To List    ${VISUA_IMAGES}    ${src}    ELSE    Append To List    ${STANDARD_IMAGES}    ${src}    # Thêm đường dẫn vào danh sách tương ứng dựa trên vai trò của người dùng
    END

Compare Lists
    [Arguments]    ${list1}    ${list2}
    [Documentation]    So sánh hai danh sách hình ảnh và in ra kết quả
    ${are_equal} =    Evaluate    ${list1} == ${list2}
    Run Keyword If    not ${are_equal}    Fail    Các hình ảnh của item sản phẩm giữa hai người dùng không khớp nhau.



