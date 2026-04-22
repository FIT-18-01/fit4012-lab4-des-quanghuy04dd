# Report 1 page - Lab 4 DES / TripleDES

## Mục tiêu

Triển khai thuật toán Data Encryption Standard (DES) và TripleDES với khả năng mã hóa/giải mã, hỗ trợ multi-block plaintext với zero padding, và kiểm thử tính đúng đắn của implementation.

## Cách làm / Method

**Cấu trúc chương trình:**
- `KeyGenerator class`: Sinh ra 16 round keys từ 64-bit master key bằng PC-1, PC-2 permutations và left shift
- `DES class`: Triển khai 16 vòng DES với expansion, S-box substitution, permutation
- `initial_permutation()` & `inverse_initial_permutation()`: Permutation đầu/cuối
- `des_encrypt_block()` & `des_decrypt_block()`: Mã hóa/giải mã 1 block 64-bit
- **Multi-block hỗ trợ**: Chia plaintext thành các block 64-bit, pad với 0 nếu cần
- **TripleDES (EDE mode)**: Encrypt with K1, Decrypt with K2, Encrypt with K3

**Chế độ hoạt động (4 modes + 1 default):**
1. Mode 1: DES Encrypt - nhận plaintext, key → output ciphertext
2. Mode 2: DES Decrypt - nhận ciphertext, key → output plaintext
3. Mode 3: TripleDES Encrypt (EDE) - nhận plaintext, 3 keys
4. Mode 4: TripleDES Decrypt (EDE-inverse) - nhận ciphertext, 3 keys
5. Default: Chạy sample test (plaintext và key cụ thể) khi không có argument

## Kết quả / Result

**Các test case:**

| Test | Plaintext | Key | Ciphertext |
|------|-----------|-----|-----------|
| Sample Default | 0000000100100011...1111 | 0000000100100011...1111 | 0101011011001100...1111 |
| Zero Key | 0000000100100011...1111 | 0000000000000000...0000 | 1000110010100110...0111 |
| All Ones | 1111111111111111...1111 | 1111111111111111...1111 | 0101011011001100...1111 |

**Kiểm thử Round-trip:** `decrypt(encrypt(plaintext, key), key) == plaintext` ✓
- Verified với nhiều plaintext khác nhau

**Multi-block & Padding:**
- 32-bit plaintext → pad 32 bits → 64-bit output ✓
- 96-bit plaintext → pad 32 bits → 128-bit output ✓
- Các block được mã hóa độc lập với nhau

**Negative Tests:**
- Tampering: Flip 1 bit ciphertext → plaintext sai ✓
- Wrong key: Decrypt với key khác → plaintext sai ✓
- Even 1 bit diff in key → completely different plaintext ✓

## Kết luận / Conclusion

**Điểm học được:**
- DES structure: Initial Perm → 16 rounds (Expansion, S-box, Permutation) → Final Perm
- Round key generation từ master key bằng shifting và permutation
- Decryption = Encryption đảo thứ tự round keys
- TripleDES (EDE) tăng độ an toàn bằng 3 key (hoặc 2 key nếu K1=K3)
- Zero padding đơn giản nhưng không an toàn trong thực tế

**Hạn chế hiện tại:**
- Zero padding không phân biệt được plaintext kết thúc bằng 0 bits
- DES chỉ 56-bit effective key (lỗi thời, khuyến cáo dùng AES)
- Chưa hỗ trợ operation modes (ECB, CBC, CTR...)
- Chưa tối ưu performance (có thể dùng lookup tables cho S-box)

**Hướng mở rộng:**
- Triển khai CBC/CTR mode với IV/nonce
- PKCS#7 padding scheme thay vì zero padding
- Benchmark performance, optimize với SIMD instructions
- Comb with other algorithms (hybrid encryption)
- Key derivation functions (KDF) cho password-based encryption
