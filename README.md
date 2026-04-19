[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/G4Lkq8iY)
# fit4012-lab2-classical-ciphers-starter

Starter repo cho **FIT4012 – Lab 2: Mã hoá cổ điển**.

## Mục tiêu
- Cài đặt và mở rộng **Caesar Cipher**.
- Cài đặt và mở rộng **Rail Fence Cipher**.
- Làm quen với quy trình nộp bài qua **GitHub repo**.
- Ghi lại minh chứng bằng **tests**, **logs** và **report-1page**.

## Nội dung chính của bài
- **Caesar Cipher**
  - Q1: xử lý chữ thường
  - Q2: giữ dấu cách
  - Q3: giải mã
- **Rail Fence Cipher**
  - Q4: thay đổi số ray và quan sát kết quả
  - Q5: giải mã
  - Q6: giữ dấu cách
  - Q7: kiểm tra đầu vào
  - Q8: đọc thông điệp từ file `input.txt`

## Cấu trúc repo
```text
fit4012-lab2-classical-ciphers-starter/
├── README.md
├── assignment-obe.md
├── assignment-classroom.md
├── buoi3-guide.md
├── report-1page.md
├── src/
│   ├── caesar.cpp
│   └── rail_fence.cpp
├── data/
│   └── input.txt
├── tests/
│   └── test_cases.md
├── logs/
│   └── run_log.md
└── .github/
    ├── scripts/
    │   └── check_lab2.py
    └── workflows/
        └── lab2-check.yml
```

## Cách làm bài
1. Nhận repo qua GitHub Classroom hoặc fork repo.
2. Hoàn thiện `src/caesar.cpp` và `src/rail_fence.cpp`.
3. Điền `tests/test_cases.md`.
4. Điền `logs/run_log.md`.
5. Hoàn thiện `report-1page.md`.
6. Commit, push và nộp link repo.

## Cách biên dịch
### Caesar Cipher
```bash
g++ -std=c++17 -O2 -Wall -Wextra -o caesar_bin src/caesar.cpp
./caesar_bin
```

### Rail Fence Cipher
```bash
g++ -std=c++17 -O2 -Wall -Wextra -o rail_bin src/rail_fence.cpp
./rail_bin
```

## File dữ liệu mẫu
Repo đã có sẵn file `data/input.txt` để phục vụ Q8.

## Lưu ý
- Không xóa các file trong `.github/`.
- Không đổi tên file nguồn trừ khi giảng viên cho phép.
- Nên có nhiều commit có ý nghĩa trong quá trình làm bài.
