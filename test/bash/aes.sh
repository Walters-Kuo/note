#!/bin/bash

# The plaintext message
plaintext="walters@gmail.com"

# The key (in hex format)
key="5a04ec902686fb05a6b7a338b6e07760"

cipher="aes-128-cbc"

#cipher_length=$(echo -n "$cipher" | wc -c)
#echo "Cipher length: $cipher_length"

# Generate a 128-bit IV
iv=$(openssl rand -hex 16)
echo "iv: $iv"

# Encrypt the plaintext
ciphertext_raw=$(echo -n "$plaintext" | openssl enc -aes-128-cbc -K $key -iv $iv | xxd -p)
echo "ciphertext_raw: $ciphertext_raw"

# Encode the IV and the ciphertext in base64
ciphertext=$(echo -n "$iv$ciphertext_raw" | xxd -r -p | base64)

echo "Ciphertext: $ciphertext"

# Decode the ciphertext from base64
ciphertext_decoded=$(echo -n "$ciphertext" | base64 -d | xxd -p)

# Extract the IV from the decoded ciphertext
iv_decoded=${ciphertext_decoded:0:32}
echo "iv_decoded: $iv_decoded"

# Extract the original ciphertext from the decoded ciphertext
original_ciphertext=${ciphertext_decoded:32}
echo "Ciphertext: $ciphertext"

# Decrypt the original ciphertext
original_plaintext=$(echo -n "$original_ciphertext" | xxd -r -p | openssl enc -aes-128-cbc -d -K $key -iv $iv_decoded)

echo "Original plaintext: $original_plaintext"