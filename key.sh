#!/data/data/com.termux/files/usr/bin/bash

echo -e "\e[1;31m Script created by 4RCH1 H4CK3R \e[0m"

echo    

echo -e "\e[1;31m This script is only for Java keystore(.jks) files... \e[0m"

echo   

echo -e "\e[1;32m This script will automatically detect the required packages and install them if not available... Allow Storage permission to termux in settings (If not allowed) before using this script... \e[0m"

echo   

echo -e "\e[1;34m The output file will be generated in the directory (internal storage/key/gen_keys/gen) with the name privkey(private key), cert(certificate) and with extension (.pk8), (.x509.pem). \e[0m"

echo   

mkdir /storage/emulated/0/key

mkdir /storage/emulated/0/key/gen_keys

mkdir /storage/emulated/0/key/gen_keys/gen

echo -e "\e[1;33m Please copy your Java keystore(with .jks extension) file to the following directory (internal storage/key/gen_keys/gen)... NOTE 1: Keep termux running in the background... NOTE 2: There should be only one keystore file in the above mentioned directory... NOTE 3: If asked for password write the password of the keystore file and hit enter everytime... NOTE 4: The password will not be visible for security reasons, so do not worry about that... Press y and hit enter after copying the keystore file... \e[0m"

echo   

termux-setup-storage

mkdir /storage/emulated/0/key/tmp

cp -r /storage/emulated/0/key/gen_keys/gen/*.jks /storage/emulated/0/key/tmp

clear

pkg install openssl-tool -y

clear

pkg install openjdk-17 -y

clear

keytool -importkeystore -srckeystore /storage/emulated/0/key/tmp/*.jks -destkeystore /storage/emulated/0/key/tmp/key.p12 -srcstoretype JKS -deststoretype PKCS12

clear

openssl pkcs12 -in /storage/emulated/0/key/tmp/key.p12  -nokeys -out /storage/emulated/0/key/gen_keys/gen/cert.x509.pem

clear

openssl pkcs12 -in /storage/emulated/0/key/tmp/key.p12 -nodes -out /storage/emulated/0/key/tmp/key.rsa.pem

clear

openssl pkcs8 -topk8 -outform DER -in /storage/emulated/0/key/tmp/key.rsa.pem -inform PEM -out /storage/emulated/0/key/gen_keys/gen/privkey.pk8 -nocrypt

clear

rm -rff /storage/emulated/0/key/tmp

clear

cd
