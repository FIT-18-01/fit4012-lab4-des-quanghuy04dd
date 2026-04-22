#!/usr/bin/env bash
# Test: Wrong key detection (negative test)
# Verifies that using a different key produces incorrect plaintext on decryption
set -euo pipefail

cd "$(dirname "$0")/.."

# Compile the program
g++ -std=c++17 -Wall -Wextra -pedantic des.cpp -o des_test

echo "[TEST] Wrong Key Detection Test"

PLAINTEXT="0000000100100011010001010110011110001001101010111100110111101111"
KEY1="1111111111111111111111111111111111111111111111111111111111111111"
KEY2="0000000000000000000000000000000000000000000000000000000000000000"

# Encrypt with KEY1
CIPHERTEXT=$(echo "1 $PLAINTEXT $KEY1" | ./des_test | sed 's/Ciphertext: //')

echo "Encrypted with KEY1"

# Try to decrypt with KEY2 (wrong key)
DECRYPTED=$(echo "2 $CIPHERTEXT $KEY2" | ./des_test | sed 's/Plaintext: //')

echo "Attempted decryption with KEY2 (wrong key)"

# Verify decryption with wrong key produces incorrect plaintext
if [ "$PLAINTEXT" != "$DECRYPTED" ]; then
    echo "[PASS] Wrong key detected: decryption with wrong key produced incorrect plaintext"
else
    echo "[FAIL] Wrong key not detected: decryption with wrong key still produced correct plaintext"
    echo "This indicates a serious security flaw in the implementation!"
    exit 1
fi

# Test 2: Decrypt with correct key to verify it works
echo ""
echo "Test 2: Verify correct key works..."
DECRYPTED_CORRECT=$(echo "2 $CIPHERTEXT $KEY1" | ./des_test | sed 's/Plaintext: //')

if [ "$PLAINTEXT" = "$DECRYPTED_CORRECT" ]; then
    echo "[PASS] Decryption with correct key produced original plaintext"
else
    echo "[FAIL] Decryption with correct key did not produce original plaintext"
    exit 1
fi

# Test 3: Try a slightly different key (flip one bit)
KEY3="0111111111111111111111111111111111111111111111111111111111111111"
echo ""
echo "Test 3: Flip one bit in key..."
DECRYPTED_WRONG=$(echo "2 $CIPHERTEXT $KEY3" | ./des_test | sed 's/Plaintext: //')

if [ "$PLAINTEXT" != "$DECRYPTED_WRONG" ]; then
    echo "[PASS] Even one bit difference in key produces wrong decryption"
else
    echo "[FAIL] One bit difference in key did not affect decryption"
    exit 1
fi

# Cleanup
rm -f des_test

echo ""
echo "All wrong key tests passed!"
