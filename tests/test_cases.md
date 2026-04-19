# Test Cases – FIT4012 Lab 2

## Caesar Cipher
- [x] Encrypt `I LOVE YOU` với key `3` → `L ORYH BRX`
- [x] Encrypt `hello world` với key `5` → `mjqqt btwqi`
- [x] Decrypt `LORYH BRX` với key `3` → `ILOVE YOU`

## Rail Fence Cipher
- [x] Encrypt `I LOVE YOU` với `2` rails → `ILV O OEYU`
- [x] Encrypt `I LOVE YOU` với `4` rails → `I  EYLVOOU`
- [x] Decrypt bản mã `ILV O OEYU` với `2` rails → `I LOVE YOU`

## Validation / File input
- [x] Kiểm tra đầu vào không hợp lệ (ví dụ `HELLO123`) → báo `Invalid input...`
- [x] Đọc thông điệp từ `data/input.txt` (`I LOVE YOU`) và encrypt với `3` rails → `IVO OEYUL`
