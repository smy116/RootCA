## SMY Root Certification Authority

### Windows install script

Download:
**[Install-To-Windows.exe](https://github.com/smy116/RootCA/releases/download/2.0/Install-To-Windows.exe)**

SHA1:2622624D5A95F8AA62E6EA9B3585BB536B848145

Shortcut:
**[https://ca.smy.me/windows](https://ca.smy.me/windows)**

### Linux install script

Download:
**[Install-To-Linux.sh](https://github.com/smy116/RootCA/releases/download/2.0/Install-To-Linux.sh)**

SHA1:82DE00412C4CFEEFB4A3B749CB3F75A4BFCCA251

Shortcut:
**[https://ca.smy.me/linux](https://ca.smy.me/linux)**

### Root cert file

Cert:
**[SMY-Root-CA-ECC.crt](https://github.com/smy116/RootCA/releases/download/2.0/SMY-Root-CA.crt)** 

Test page:
**[https://test-ecc.ca.smy.me](https://test.ca.smy.me)** 

SHA1:87C2991C8409C88A4956D54FB4AF3F955233F797

Shortcut:
**[https://ca.smy.me/ca-ecc](https://ca.smy.me/ca)**

## VPS init script


###  via curl to install script

```bash
bash -c "$(curl -s -L https://ca.smy.me/init.sh)"
```

#### Shortcut
Install Root CA:
```bash
bash -c "$(curl -s -L https://ca.smy.me/init.sh)" -- ca
```

Install SSH Key and Change root password:
```bash
bash -c "$(curl -s -L https://ca.smy.me/init.sh)" -- root $password
```

Change SSH Port to 54422:
```bash
bash -c "$(curl -s -L https://ca.smy.me/init.sh)" -- sshport
```

### via wget to install script

```bash
bash -c "$(wget -q -O - https://ca.smy.me/init.sh)"
```
