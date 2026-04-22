[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/BJH8GGf3)
# FIT4012 - Lab 4: DES / TripleDES Starter Repository

Repo này là **starter repo** cho Lab 4 của FIT4012.  

## 1. Cấu trúc repo

```text
.
├── .github/
│   ├── scripts/
│   │   └── check_submission.sh
│   └── workflows/
│       └── ci.yml
├── logs/
│   ├── .gitkeep
│   └── README.md
├── scripts/
│   └── run_sample.sh
├── tests/
│   ├── test_des_sample.sh
│   ├── test_encrypt_decrypt_roundtrip.sh
│   ├── test_multiblock_padding.sh
│   ├── test_tamper_negative.sh
│   └── test_wrong_key_negative.sh
├── .gitignore
├── CMakeLists.txt
├── Makefile
├── README.md
├── des.cpp
└── report-1page.md
```

## 2. Cách chạy chương trình (How to run)

### Cách 1: Dùng Makefile

```bash
make
./des
```

### Cách 2: Biên dịch trực tiếp

```bash
g++ -std=c++17 -Wall -Wextra -pedantic des.cpp -o des
./des
```

### Cách 3: Dùng CMake

```bash
cmake -S . -B build
cmake --build build
./build/des
```

## 3. Input / Đầu vào

Chương trình hỗ trợ 4 chế độ hoạt động (mode 1-4):

**Mode 1 - DES Encryption (Mã hóa DES):**
- Input: `1 plaintext key`
- plaintext: chuỗi 64 bit nhị phân (có thể dài hơn - sẽ tự động chia thành các block 64 bit)
- key: chuỗi 64 bit nhị phân
- Ví dụ: `1 0000000100100011010001010110011110001001101010111100110111101111 0000000100100011010001010110011110001001101010111100110111101111`

**Mode 2 - DES Decryption (Giải mã DES):**
- Input: `2 ciphertext key`
- ciphertext: chuỗi bit nhị phân (độ dài phải là bội số của 64)
- key: chuỗi 64 bit nhị phân
- Ví dụ: `2 0101011011001100000010011110011111001111110111000100110011101111 0000000100100011010001010110011110001001101010111100110111101111`

**Mode 3 - TripleDES Encryption:**
- Input: `3 plaintext key1 key2 key3`
- plaintext: chuỗi 64 bit nhị phân
- key1, key2, key3: mỗi cái là 64 bit nhị phân

**Mode 4 - TripleDES Decryption:**
- Input: `4 ciphertext key1 key2 key3`
- ciphertext: chuỗi 64 bit nhị phân
- key1, key2, key3: mỗi cái là 64 bit nhị phân

**Default Mode (Khi chạy không có input):**
- Chương trình chạy sample test mặc định với plaintext và key cụ thể
- Output: `Ciphertext: <binary_string>`

## 4. Output / Đầu ra

- **Mode 1 (DES Encrypt):** In ra `Ciphertext: <ciphertext_binary>` - ciphertext dài bằng plaintext (sau khi pad về bội số 64 bit)
- **Mode 2 (DES Decrypt):** In ra `Plaintext: <plaintext_binary>` - plaintext dài bằng ciphertext (bao gồm padding)
- **Mode 3 (TripleDES Encrypt):** In ra `TripleDES Ciphertext: <ciphertext_binary>` - ciphertext 64 bit
- **Mode 4 (TripleDES Decrypt):** In ra `TripleDES Plaintext: <plaintext_binary>` - plaintext 64 bit
- **Default Mode:** In ra `Ciphertext: <ciphertext_binary>`

Chương trình hỗ trợ giải mã (Mode 2 và 4) để có thể xác minh encrypt-decrypt roundtrip.
TripleDES được triển khai theo chuẩn EDE (Encrypt-Decrypt-Encrypt).

## 5. Padding đang dùng

**Zero Padding:** Chương trình sử dụng zero padding để mở rộng plaintext:

- Nếu plaintext ngắn hơn 64 bit: pad với các bit `0` ở cuối cho đến khi đủ 64 bit
- Nếu plaintext dài hơn 64 bit: chia thành các block 64 bit, block cuối cùng (nếu < 64 bit) được pad với `0`
- Ví dụ: plaintext 32 bit → pad 32 bit 0 để thành 64 bit

**Hạn chế của Zero Padding:**
- Không thể phân biệt giữa zero padding được thêm vào và các bit 0 trong plaintext gốc
- Nếu plaintext gốc kết thúc bằng các bit 0, sẽ không thể recover được chính xác khi decrypt
- Vì vậy, phương pháp này chỉ phù hợp cho bài học nhập môn, không dùng trong thực tế an toàn

**Sử dụng trong thực tế:**
- Thực tế sử dụng PKCS#7 padding hoặc ANSI X9.23 padding để giải quyết vấn đề này
- DES đã lỗi thời (khuyến cáo dùng AES), nhưng nếu vẫn dùng DES cần padding scheme an toàn

## 6. Tests bắt buộc

Repo này đã tạo sẵn **5 tên file test mẫu** để sinh viên điền nội dung:

- `tests/test_des_sample.sh` - **Hoàn thiện**: Kiểm tra DES mã hóa sample mặc định
  - Test 1: Chạy default sample test không có input
  - Test 2: Kiểm tra encryption với plaintext và key cụ thể
  
- `tests/test_encrypt_decrypt_roundtrip.sh` - **Hoàn thiện**: Kiểm tra encrypt → decrypt roundtrip
  - Test 1: Mã hóa plaintext, sau đó giải mã, kiểm tra kết quả bằng plaintext gốc
  - Test 2: Kiểm tra với plaintext khác
  - Hỗ trợ plaintext và key khác nhau
  
- `tests/test_multiblock_padding.sh` - **Hoàn thiện**: Kiểm tra multi-block và zero padding
  - Test 1: 128-bit plaintext (2 block đầy đủ)
  - Test 2: 32-bit plaintext (cần padding)
  - Test 3: 96-bit plaintext (cần padding)
  - Xác minh output có độ dài đúng sau padding
  
- `tests/test_tamper_negative.sh` - **Hoàn thiện**: Kiểm tra phát hiện tamper (negative test)
  - Test 1: Flip bit đầu tiên của ciphertext, kiểm tra decrypt sai
  - Test 2: Flip multiple bits ở giữa ciphertext
  - Xác minh tampering làm thay đổi plaintext
  
- `tests/test_wrong_key_negative.sh` - **Hoàn thiện**: Kiểm tra phát hiện sai key (negative test)
  - Test 1: Decrypt với key sai, kiểm tra plaintext sai
  - Test 2: Decrypt với key đúng, kiểm tra plaintext đúng
  - Test 3: Flip 1 bit trong key, kiểm tra decrypt bị ảnh hưởng
  - Xác minh even 1 bit khác trong key cũng dẫn đến plaintext sai

## 7. Logs / Minh chứng

Thư mục `logs/` dùng để nộp minh chứng, ví dụ:
- ảnh chụp màn hình khi chạy chương trình
- output của test
- log thử đúng / sai key / tamper
- log cho mã hóa nhiều block

## 8. Ethics & Safe use

- Chỉ chạy và kiểm thử trên dữ liệu học tập hoặc dữ liệu giả lập.
- Không dùng repo này để tấn công hay can thiệp hệ thống thật.
- Không trình bày đây là công cụ bảo mật sẵn sàng cho môi trường sản xuất.
- Nếu tham khảo mã, tài liệu, công cụ hoặc AI, phải ghi nguồn rõ ràng.
- Khi cộng tác nhóm, cần trung thực học thuật và mô tả đúng phần việc của mình.
- Việc kiểm thử chỉ phục vụ học DES / TripleDES ở mức nhập môn.

## 9. Checklist nộp bài

Trước khi nộp, cần có:
- `des.cpp`
- `README.md` hoàn chỉnh
- `report-1page.md` hoàn chỉnh
- `tests/` với ít nhất 5 test
- có negative test cho `tamper` và `wrong key`
- `logs/` có ít nhất 1 file minh chứng thật
- không còn dòng `TODO_STUDENT`

## 10. Lưu ý về CI

CI sẽ **không chỉ kiểm tra file có tồn tại** mà còn kiểm tra:
- các mục bắt buộc trong README
- các mục bắt buộc trong report
- sự hiện diện của negative tests
- có minh chứng trong `logs/`
- repo **không còn placeholder `TODO_STUDENT`**

Vì vậy repo starter này sẽ **chưa pass CI** cho tới khi sinh viên hoàn thiện nội dung.


## 11. Submission contract để auto-check Q2 và Q4

Để GitHub Actions kiểm tra được **Q2** và **Q4**, repo này dùng **một contract nhập/xuất thống nhất**.
Sinh viên cần sửa `des.cpp` để chương trình nhận dữ liệu từ **stdin** theo đúng thứ tự sau:

```text
Chọn mode:
1 = DES encrypt
2 = DES decrypt
3 = TripleDES encrypt
4 = TripleDES decrypt
```

### Mode 1: DES encrypt 
Nhập lần lượt:
1. `1`
2. plaintext nhị phân
3. key 64-bit

Yêu cầu:
- nếu plaintext dài hơn 64 bit: chia block 64 bit và mã hóa tuần tự
- nếu block cuối thiếu bit: zero padding
- in ra **ciphertext cuối cùng** dưới dạng chuỗi nhị phân

### Mode 2: DES decrypt
Nhập lần lượt:
1. `2`
2. ciphertext nhị phân
3. key 64-bit

Yêu cầu:
- giải mã DES theo round keys đảo ngược
- in ra plaintext cuối cùng

### Mode 3: TripleDES encrypt 
Nhập lần lượt:
1. `3`
2. plaintext 64-bit
3. `K1`
4. `K2`
5. `K3`

Yêu cầu:
- thực hiện đúng chuỗi **E(K3, D(K2, E(K1, P)))**
- in ra ciphertext cuối cùng

### Mode 4: TripleDES decrypt 
Nhập lần lượt:
1. `4`
2. ciphertext 64-bit
3. `K1`
4. `K2`
5. `K3`

Yêu cầu:
- thực hiện giải mã TripleDES ngược lại
- in ra plaintext cuối cùng

### Lưu ý về output
- Có thể in prompt tiếng Việt hoặc tiếng Anh.
- Có thể in thêm round keys hay thông báo trung gian.
- Nhưng **kết quả cuối cùng phải xuất hiện dưới dạng một chuỗi nhị phân dài hợp lệ** để CI tách và đối chiếu.

## 14. CI hiện kiểm tra được gì

Ngoài checklist nộp bài, CI hiện còn kiểm tra tự động:
- chương trình thực sự nhận plaintext/key từ bàn phím và mã hóa multi-block với zero padding đúng.
- chương trình thực sự mã hóa và giải mã TripleDES đúng theo vector kiểm thử.

Nói cách khác, nếu sinh viên chỉ sửa README/tests cho đủ hình thức mà **không làm Q2 hoặc Q4**, CI sẽ vẫn fail.
