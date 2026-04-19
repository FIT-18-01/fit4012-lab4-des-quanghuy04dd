# Report 1 Page – FIT4012 Lab 2

## 1. Mục tiêu
Mục tiêu của bài lab là cài đặt và mở rộng hai thuật toán mã hóa cổ điển gồm Caesar Cipher và Rail Fence Cipher bằng C++. Bài làm tập trung vào khả năng mã hóa/giải mã, xử lý chữ thường, giữ dấu cách, kiểm tra đầu vào hợp lệ và đọc dữ liệu từ file để mô phỏng tình huống sử dụng thực tế.

## 2. Cách làm
- Hoàn thiện Caesar Cipher cho chữ thường, dấu cách và giải mã.
- Hoàn thiện Rail Fence Cipher cho giải mã, giữ dấu cách, kiểm tra đầu vào và đọc file.
- Chạy thử trên nhiều test case.

## 3. Kết quả chính
### 3.1 Caesar Cipher
| Input | Key | Ciphertext / Plaintext | Nhận xét |
|---|---:|---|---|
| I LOVE YOU | 3 | `L ORYH BRX` | Mã hóa đúng, giữ dấu cách |
| hello world | 5 | `mjqqt btwqi` | Hỗ trợ chữ thường đúng |
| LORYH BRX | 3 | `ILOVE YOU` | Giải mã đúng theo bản mã đầu vào |

### 3.2 Rail Fence Cipher
| Input | Rails | Ciphertext / Plaintext | Nhận xét |
|---|---:|---|---|
| I LOVE YOU | 2 | `ILV O OEYU` | Zigzag 2 ray đúng, giữ dấu cách |
| I LOVE YOU | 4 | `I  EYLVOOU` | Kết quả thay đổi theo số ray |
| ILV O OEYU | 2 | `I LOVE YOU` | Giải mã Rail Fence đúng |

### 3.3 Input validation / file input
- Trường hợp đầu vào không hợp lệ:
- Ví dụ nhập `HELLO123` → chương trình báo `Invalid input. Only letters and spaces are allowed.`
- Kết quả đọc từ `data/input.txt`:
- Đọc được thông điệp `I LOVE YOU`; mã hóa với `3` rails cho ra `IVO OEYUL`.

## 4. Kết luận
Qua bài lab, em hiểu rõ cơ chế dịch ký tự của Caesar Cipher và cơ chế đi-zigzag của Rail Fence Cipher. Phần khó nhất là cài đặt giải mã Rail Fence do cần dựng lại đúng mẫu đường đi trước khi đọc ký tự. Việc viết test cases, chạy kiểm thử với nhiều đầu vào và ghi run log giúp em kiểm tra tính đúng đắn của chương trình và nắm chắc hơn bản chất của hai thuật toán mã hóa cổ điển.
