# Hướng dẫn thực hiện Lab 2 – Mã hoá cổ điển

Chào mừng bạn đến với bài lab về **Caesar Cipher** và **Rail Fence Cipher**.

## 1. Mục tiêu
Bài này giúp bạn:
- hiểu cách hoạt động của hai mã cổ điển;
- biết cách cài đặt mã hoá và giải mã bằng C++;
- biết cách kiểm thử, ghi log và nộp bài bằng GitHub repo.

## 2. Bạn sẽ làm gì?
### Phần A. Caesar Cipher
- hoàn thiện mã hoá Caesar;
- hỗ trợ chữ thường;
- giữ dấu cách;
- viết giải mã.

### Phần B. Rail Fence Cipher
- mã hoá với số ray khác nhau;
- viết giải mã;
- giữ dấu cách;
- kiểm tra đầu vào;
- đọc dữ liệu từ file.

## 3. Cách làm bài
### Bước 1. Nhận repo
Nhận repo qua GitHub Classroom hoặc fork repo starter.

### Bước 2. Hoàn thiện code
- mở `src/caesar.cpp` và làm Q1–Q3;
- mở `src/rail_fence.cpp` và làm Q4–Q8.

### Bước 3. Chạy thử
Biên dịch từng file và ghi lại test case vào `tests/test_cases.md`.

### Bước 4. Ghi log
Ghi kết quả chạy vào `logs/run_log.md`.

### Bước 5. Viết report
Hoàn thiện `report-1page.md`.

### Bước 6. Commit và push
```bash
git add .
git commit -m "Complete Lab 2 classical ciphers"
git push origin main
```

## 4. Mẹo nhỏ
- Với Caesar, chú ý xử lý ký tự chữ cái và dấu cách riêng.
- Với Rail Fence, hãy hình dung đường đi zigzag trước khi code.
- Với input không hợp lệ, chương trình nên báo lỗi rõ ràng.
- Với Q8, hãy dùng file `data/input.txt` có sẵn trong repo.

## 5. Checklist trước khi nộp
- [ ] Đã hoàn thiện `src/caesar.cpp`
- [ ] Đã hoàn thiện `src/rail_fence.cpp`
- [ ] Đã điền `tests/test_cases.md`
- [ ] Đã điền `logs/run_log.md`
- [ ] Đã điền `report-1page.md`
- [ ] Đã push lên GitHub
