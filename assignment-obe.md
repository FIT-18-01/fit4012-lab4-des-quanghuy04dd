# FIT4012 – Lab 2: Mã hoá cổ điển

## 1. Mục tiêu bài lab
Sau khi hoàn thành bài lab này, sinh viên có thể:
1. Giải thích được nguyên lý mã hoá và giải mã của Caesar Cipher.
2. Cài đặt và mở rộng chương trình Caesar để xử lý chữ thường, dấu cách và giải mã.
3. Giải thích được cách hoạt động zigzag của Rail Fence Cipher.
4. Cài đặt và mở rộng chương trình Rail Fence để giải mã, xử lý dấu cách, kiểm tra đầu vào và đọc dữ liệu từ file.
5. Tổ chức, kiểm thử và nộp bài bằng GitHub repo.

## 2. Nội dung chuyên môn
### 2.1 Caesar Cipher
- Q1: Tinh chỉnh code mẫu để chương trình có thể xử lý cả chữ cái viết thường mà không cần chuyển đổi đầu vào sang chữ cái in hoa.
- Q2: Điều chỉnh chương trình Caesar để xử lý dấu cách trong thông điệp gốc. Thay vì bỏ dấu cách trước khi mã hóa, giữ nguyên dấu cách và mã hóa cả chúng.
- Q3: Viết chương trình giải mã Caesar khi người dùng nhập bản mã và khoá.

### 2.2 Rail Fence Cipher
- Q4: Thay đổi số đường ray thành 4 và quan sát kết quả.
- Q5: Viết chương trình giải mã Rail Fence.
- Q6: Điều chỉnh chương trình Rail Fence để xử lý dấu cách trong thông điệp gốc. Thay vì bỏ dấu cách trước khi mã hóa, giữ nguyên dấu cách và mã hóa cả chúng.
- Q7: Hoàn thiện chương trình bằng cách kiểm tra đầu vào: chỉ chấp nhận chữ cái và dấu cách.
- Q8: Điều chỉnh chương trình để đọc thông điệp từ file `input.txt` thay vì nhập từ bàn phím.

## 3. Sản phẩm nộp
Sinh viên nộp **1 repo GitHub** gồm:
- mã nguồn C++ hoàn chỉnh cho Caesar Cipher và Rail Fence Cipher;
- `README.md` mô tả mục tiêu bài lab và cách chạy chương trình;
- `tests/test_cases.md` chứa tối thiểu 6 test cases đã chạy;
- `logs/run_log.md` ghi lại quá trình chạy thử và kết quả;
- `report-1page.md` tóm tắt mục tiêu, cách làm, kết quả và kết luận.

## 4. Minh chứng cần có
- Ít nhất 1 ví dụ mã hoá Caesar.
- Ít nhất 1 ví dụ giải mã Caesar.
- Ít nhất 1 ví dụ mã hoá Rail Fence với 2 hoặc 4 ray.
- Ít nhất 1 ví dụ giải mã Rail Fence.
- Minh chứng xử lý dấu cách.
- Minh chứng kiểm tra đầu vào không hợp lệ.
- Minh chứng đọc từ file `data/input.txt`.

## 5. Tiêu chí đạt
Bài làm được xem là đạt khi:
- chương trình biên dịch và chạy được;
- kết quả mã hoá và giải mã hợp lý;
- có test cases;
- có README, report và run log;
- repo được tổ chức rõ ràng.

## 6. Rubric (10 điểm)
| Tiêu chí | Điểm |
|---|---:|
| Caesar Cipher: Q1–Q3 | 3 |
| Rail Fence Cipher: Q4–Q8 | 4 |
| Tests và minh chứng chạy | 2 |
| README + report + repo sạch | 1 |

## 7. Cách nộp bài
1. Nhận assignment qua GitHub Classroom.
2. Làm bài trong repo cá nhân.
3. Commit và push lên GitHub.
4. Nộp link repo theo đúng lớp/nhóm.
