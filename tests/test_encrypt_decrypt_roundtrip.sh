#!/usr/bin/env bash
# Test: Round-trip encryption and decryption
# Verifies that decrypt(encrypt(plaintext)) = plaintext
set -euo pipefail

cd "$(dirname "$0")/.."

# Compile the program
g++ -std=c++17 -Wall -Wextra -pedantic des.cpp -o des_test

echo "[TEST] DES Round-trip Encryption/Decryption"

# Test vector 1: Simple plaintext
PLAINTEXT1="0000000100100011010001010110011110001001101010111100110111101111"
KEY1="1111111111111111111111111111111111111111111111111111111111111111"

echo "Test 1: Round-trip with random key..."
CIPHERTEXT=$(echo "1 $PLAINTEXT1 $KEY1" | ./des_test | sed 's/Ciphertext: //')
DECRYPTED=$(echo "2 $CIPHERTEXT $KEY1" | ./des_test | sed 's/Plaintext: //')

if [ "$PLAINTEXT1" = "$DECRYPTED" ]; then
    echo "[PASS] Round-trip test 1 passed"
else
    echo "[FAIL] Round-trip test 1 failed"
    echo "Original:  $PLAINTEXT1"
    echo "Decrypted: $DECRYPTED"
    exit 1
fi

# Test vector 2: Different plaintext
PLAINTEXT2="1010101010101010101010101010101010101010101010101010101010101010"
KEY2="1111111111111111111111111111111111111111111111111111111111111111"

echo "Test 2: Round-trip with different plaintext..."
CIPHERTEXT=$(echo "1 $PLAINTEXT2 $KEY2" | ./des_test | sed 's/Ciphertext: //')
DECRYPTED=$(echo "2 $CIPHERTEXT $KEY2" | ./des_test | sed 's/Plaintext: //')

if [ "$PLAINTEXT2" = "$DECRYPTED" ]; then
    echo "[PASS] Round-trip test 2 passed"
else
    echo "[FAIL] Round-trip test 2 failed"
    echo "Original:  $PLAINTEXT2"
    echo "Decrypted: $DECRYPTED"
    exit 1
fi

# Cleanup
rm -f des_test

echo ""
echo "All round-trip tests passed!"
