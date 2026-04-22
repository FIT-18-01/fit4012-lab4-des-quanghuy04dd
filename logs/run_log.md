# Run Log – FIT4012 Lab 2

## Caesar Cipher
- [x] Đã chạy Caesar encrypt với `I LOVE YOU`, key `3` → `L ORYH BRX`
- [x] Đã chạy Caesar encrypt với `hello world`, key `5` → `mjqqt btwqi`
- [x] Đã chạy Caesar decrypt với `LORYH BRX`, key `3` → `ILOVE YOU`

## Rail Fence Cipher
- [x] Đã chạy Rail Fence encrypt với `2` rails (`I LOVE YOU`) → `ILV O OEYU`
- [x] Đã chạy Rail Fence encrypt với `4` rails (`I LOVE YOU`) → `I  EYLVOOU`
- [x] Đã chạy Rail Fence decrypt (`ILV O OEYU`, 2 rails) → `I LOVE YOU`

## Validation / File input
- [x] Đã kiểm tra đầu vào không hợp lệ (`HELLO123`) → báo lỗi `Invalid input. Only letters and spaces are allowed.`
- [x] Đã đọc dữ liệu từ `data/input.txt` (`I LOVE YOU`) và mã hoá với `3` rails → `IVO OEYUL`

## Điều em học được từ bài lab
Em hiểu rõ hơn cách Caesar dịch chuyển từng ký tự theo khóa và giữ nguyên ký tự không phải chữ cái (như dấu cách).
Với Rail Fence, em nắm được cách đi zigzag để mã hoá và cách dựng lại mẫu zigzag để giải mã chính xác.
Em cũng học được tầm quan trọng của kiểm tra đầu vào để tránh dữ liệu sai làm chương trình chạy không đúng.
Ngoài ra, việc ghi test cases và run log giúp em kiểm soát tiến độ và chứng minh kết quả rõ ràng hơn.
