## SMY Root Certification Authority

### Windows install script

Download:
**[Install-To-Windows.exe](https://github.com/smy116/RootCA/releases/download/2.0/Install-To-Windows.exe)**

SHA1:2622624D5A95F8AA62E6EA9B3585BB536B848145

### Linux install script

Download:
**[Install-To-Linux.sh](https://github.com/smy116/RootCA/releases/download/2.0/Install-To-Linux.sh)**

SHA1:82DE00412C4CFEEFB4A3B749CB3F75A4BFCCA251

### Root cert file

RSA Cert:
**[SMY-Root-CA-RSA.crt](https://github.com/smy116/RootCA/releases/download/2.0/SMY-Root-CA-RSA.crt)** 

SHA1:75FC84ABD78F155AF3030D19735C9826ADD1A9B0

ECC Cert:
**[SMY-Root-CA-ECC.crt](https://github.com/smy116/RootCA/releases/download/2.0/SMY-Root-CA-ECC.crt)** 

SHA1:87C2991C8409C88A4956D54FB4AF3F955233F797

## VPS init script


####  via curl to install script

```bash
bash -c "$(curl -s -L https://ca.smy.life/init)"
```

#### via wget to install script

```bash
bash -c "$(wget -q -O - https://ca.smy.life/init)"
```
