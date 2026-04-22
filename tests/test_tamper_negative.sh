#!/usr/bin/env bash
# Test: Tampering detection (negative test)
# Verifies that modifying ciphertext produces incorrect plaintext
set -euo pipefail

cd "$(dirname "$0")/.."

# Compile the program
g++ -std=c++17 -Wall -Wextra -pedantic des.cpp -o des_test

echo "[TEST] Tamper Detection Test"

PLAINTEXT="0000000100100011010001010110011110001001101010111100110111101111"
KEY="1111111111111111111111111111111111111111111111111111111111111111"

# Encrypt the plaintext
CIPHERTEXT=$(echo "1 $PLAINTEXT $KEY" | ./des_test | sed 's/Ciphertext: //')

echo "Original ciphertext: $CIPHERTEXT"

# Tamper: flip the first bit
TAMPERED_CIPHERTEXT="$(echo "$CIPHERTEXT" | sed 's/^0/1/' | sed 's/^1/0/')"

echo "Tampered ciphertext: $TAMPERED_CIPHERTEXT"

# Decrypt the tampered ciphertext
DECRYPTED=$(echo "2 $TAMPERED_CIPHERTEXT $KEY" | ./des_test | sed 's/Plaintext: //')

echo "Decrypted tampered: $DECRYPTED"

# Verify decryption produces different plaintext
if [ "$PLAINTEXT" != "$DECRYPTED" ]; then
    echo "[PASS] Tampering detected: modified ciphertext produced incorrect plaintext"
else
    echo "[FAIL] Tampering not detected: modified ciphertext still produced correct plaintext"
    exit 1
fi

# Tamper test 2: Flip multiple bits in the middle
echo ""
echo "Test 2: Flip multiple bits in the middle..."
# Get first 32 characters and last 32 characters, flip a bit in between
TAMPERED2="${CIPHERTEXT:0:32}1${CIPHERTEXT:33}"
DECRYPTED2=$(echo "2 $TAMPERED2 $KEY" | ./des_test | sed 's/Plaintext: //')

if [ "$PLAINTEXT" != "$DECRYPTED2" ]; then
    echo "[PASS] Test 2: Tampering at middle bits detected"
else
    echo "[FAIL] Test 2: Tampering at middle bits not detected"
    exit 1
fi

# Cleanup
rm -f des_test

echo ""
echo "All tamper detection tests passed!"
