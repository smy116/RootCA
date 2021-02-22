#!/bin/bash
echo "================================"
echo "SMY Root CA Tool"
echo "================================"
sudo cp SMY-ROOT-CA.crt /usr/local/share/ca-certificates/SMY-ROOT-CA.crt
sudo update-ca-certificates

echo "Install SMY Root CA Successful!"