#!/usr/bin/env bash
# Test: DES sample encryption with known plaintext and key
set -euo pipefail

cd "$(dirname "$0")/.."

# Compile the program
g++ -std=c++17 -Wall -Wextra -pedantic des.cpp -o des_test

# Test 1: Run default sample test (should output ciphertext)
echo "[TEST 1] Running default DES sample..."
OUTPUT=$(./des_test)
if echo "$OUTPUT" | grep -q "Ciphertext:"; then
    echo "[PASS] Default sample test produced ciphertext output"
else
    echo "[FAIL] Default sample test did not produce expected output"
    echo "Output: $OUTPUT"
    exit 1
fi

# Test 2: Single block encryption with known vectors
echo "[TEST 2] DES single block encryption..."
PLAINTEXT="0000000100100011010001010110011110001001101010111100110111101111"
KEY="0000000100100011010001010110011110001001101010111100110111101111"
RESULT=$(echo "1 $PLAINTEXT $KEY" | ./des_test)

if echo "$RESULT" | grep -q "Ciphertext: 0101011011001100000010011110011111001111110111000100110011101111"; then
    echo "[PASS] Single block encryption test passed"
else
    echo "[FAIL] Encryption result does not match expected"
    echo "Got: $RESULT"
    exit 1
fi

# Cleanup
rm -f des_test

echo ""
echo "All DES sample tests passed!"
