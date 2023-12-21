#!/bin/bash
echo "================================"
echo "SMY Root CA Tool"
echo "================================"
sudo cp SMY-Root-CA-ECC.crt /usr/local/share/ca-certificates/SMY-Root-CA-ECC.crt
sudo cp SMY-Root-CA-RSA.crt /usr/local/share/ca-certificates/SMY-Root-CA-RSA.crt
sudo update-ca-certificates

echo "Install SMY Root CA Successful!"