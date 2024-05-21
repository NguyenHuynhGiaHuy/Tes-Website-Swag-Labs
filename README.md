Thành viên nhóm: Nguyễn Quỳnh Như - Nguyễn Huỳnh Gia Huy - Tạ Hữu Nhân - Nguyễn Văn Thịnh 
Cách chạy code : 

Bước 1: Cài đặt Python và pip
Tải và cài đặt Python từ trang chủ Python. Hãy chắc chắn rằng bạn chọn tùy chọn thêm Python vào PATH trong quá trình cài đặt.
Kiểm tra cài đặt: Mở terminal (hoặc Command Prompt trên Windows) và chạy:
  python -- version
  pip --version

Bước 2: Cài đặt VS Code
Tải và cài đặt Visual Studio Code từ trang chủ VS Code.

Bước 3: Cài đặt các gói mở rộng cần thiết cho VS Code
Mở VS Code và vào phần Extensions (hoặc nhấn Ctrl + Shift + X).
Cài đặt các extensions sau:
Python
Robot Framework Language Server
Robot Framework Formatter
RobotCode - Robot Framework Support

Bước 4: Cài đặt Robot Framework và Selenium
Cài đặt các gói cần thiết trong môi trường ảo:
pip install robotframework
pip install robotframework-seleniumlibrary

Bước 5: Mở thư mục Source code vừa tải 

Bước 6: Chạy test case
Mở terminal trong VS Code và chắc chắn rằng môi trường ảo đã được kích hoạt.
Chạy lệnh sau để thực thi test case: robot (tên file cần chạy).robot

Bước 7: Xem kết quả test
Kết quả test sẽ được lưu trong các file output.xml, report.html, và log.html trong cùng thư mục với các file .robot
Mở file report.html trong trình duyệt để xem chi tiết kết quả test.





