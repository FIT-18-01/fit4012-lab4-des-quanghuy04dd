#!/usr/bin/env bash
# Test: Multi-block encryption with zero padding
# Verifies correct handling of plaintexts longer than 64 bits
set -euo pipefail

cd "$(dirname "$0")/.."

# Compile the program
g++ -std=c++17 -Wall -Wextra -pedantic des.cpp -o des_test

echo "[TEST] DES Multi-block Encryption with Padding"

KEY="1111111111111111111111111111111111111111111111111111111111111111"

# Test 1: Plaintext with exactly 128 bits (2 blocks, no padding needed)
PLAINTEXT_128="00000001001000110100010101100111100010011010101111001101111011110000000100100011010001010110011110001001101010111100110111101111"
echo "Test 1: 128-bit plaintext (2 full blocks)..."
RESULT=$(echo "1 $PLAINTEXT_128 $KEY" | ./des_test)
CIPHERTEXT=$(echo "$RESULT" | sed 's/Ciphertext: //')

# Verify output is 128 bits (2 x 64-bit blocks)
CIPHERTEXT_LEN=$(echo -n "$CIPHERTEXT" | wc -c)
if [ "$CIPHERTEXT_LEN" -eq 128 ]; then
    echo "[PASS] 128-bit plaintext produced 128-bit ciphertext"
else
    echo "[FAIL] Expected 128-bit ciphertext, got $CIPHERTEXT_LEN bits"
    exit 1
fi

# Test 2: Plaintext shorter than 64 bits (requires padding)
PLAINTEXT_32="00000001001000110100010101100111"  # 32 bits
echo "Test 2: 32-bit plaintext (requires zero padding)..."
RESULT=$(echo "1 $PLAINTEXT_32 $KEY" | ./des_test)
CIPHERTEXT=$(echo "$RESULT" | sed 's/Ciphertext: //')

# Verify output is 64 bits (padded to 1 block)
CIPHERTEXT_LEN=$(echo -n "$CIPHERTEXT" | wc -c)
if [ "$CIPHERTEXT_LEN" -eq 64 ]; then
    echo "[PASS] 32-bit plaintext produced 64-bit ciphertext (correctly padded)"
else
    echo "[FAIL] Expected 64-bit ciphertext, got $CIPHERTEXT_LEN bits"
    exit 1
fi

# Test 3: Plaintext longer than 64 bits but not multiple of 64 (requires padding)
PLAINTEXT_96="000000010010001101000101011001111000100110101011110011011110111100000001001000110100010101100111"  # 96 bits
echo "Test 3: 96-bit plaintext (requires zero padding to 128 bits)..."
RESULT=$(echo "1 $PLAINTEXT_96 $KEY" | ./des_test)
CIPHERTEXT=$(echo "$RESULT" | sed 's/Ciphertext: //')

# Verify output is 128 bits (padded to 2 blocks)
CIPHERTEXT_LEN=$(echo -n "$CIPHERTEXT" | wc -c)
if [ "$CIPHERTEXT_LEN" -eq 128 ]; then
    echo "[PASS] 96-bit plaintext produced 128-bit ciphertext (correctly padded)"
else
    echo "[FAIL] Expected 128-bit ciphertext, got $CIPHERTEXT_LEN bits"
    exit 1
fi

# Cleanup
rm -f des_test

echo ""
echo "All multi-block padding tests passed!"
