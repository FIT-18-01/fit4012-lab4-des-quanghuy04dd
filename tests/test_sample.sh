#!/usr/bin/env bash
set -euo pipefail

# Expected ciphertext from default sample test
# (using plaintext = key = 0000000100100011010001010110011110001001101010111100110111101111)
EXPECTED="Ciphertext: 0101011011001100000010011110011111001111110111000100110011101111"

g++ -std=c++17 -Wall -Wextra -pedantic des.cpp -o des_test
OUTPUT=$(./des_test)
LAST_LINE=$(printf "%s\n" "$OUTPUT" | tail -n 1)

if [[ "$LAST_LINE" != "$EXPECTED" ]]; then
  echo "[FAIL] Unexpected ciphertext output"
  echo "Expected: $EXPECTED"
  echo "Actual:   $LAST_LINE"
  exit 1
fi

echo "[PASS] Sample DES program produced the expected ciphertext."
rm -f des_test
