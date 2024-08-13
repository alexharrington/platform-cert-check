# test-cert.sh

## Usage
Put your certificate to test in file `example.org.crt`
Put the accompanying certificate chain in `example.org.chain.crt`.

```
./test-cert.sh example.org all
```

The tool will check the certificate and chain against all platforms in `cacerts` and report compatibility:

```
Testing cacerts/android-4.2
example.org.crt: OK
Chain:
depth=0: CN = *.example.org (untrusted)
depth=1: C = US, O = "DigiCert, Inc.", CN = RapidSSL G5 TLS RSA4096 SHA384 2022 CA1 (untrusted)
depth=2: C = US, O = "DigiCert, Inc.", CN = DigiCert TLS RSA4096 Root G5 (untrusted)
depth=3: C = US, O = DigiCert Inc, OU = www.digicert.com, CN = DigiCert Global Root CA

Testing cacerts/android-4.4
example.org.crt: OK
Chain:
depth=0: CN = *.example.org (untrusted)
depth=1: C = US, O = "DigiCert, Inc.", CN = RapidSSL G5 TLS RSA4096 SHA384 2022 CA1 (untrusted)
depth=2: C = US, O = "DigiCert, Inc.", CN = DigiCert TLS RSA4096 Root G5 (untrusted)
depth=3: C = US, O = DigiCert Inc, OU = www.digicert.com, CN = DigiCert Global Root CA

Testing cacerts/android-6.0
example.org.crt: OK
Chain:
depth=0: CN = *.example.org (untrusted)
depth=1: C = US, O = "DigiCert, Inc.", CN = RapidSSL G5 TLS RSA4096 SHA384 2022 CA1 (untrusted)
depth=2: C = US, O = "DigiCert, Inc.", CN = DigiCert TLS RSA4096 Root G5 (untrusted)
depth=3: C = US, O = DigiCert Inc, OU = www.digicert.com, CN = DigiCert Global Root CA

Testing cacerts/android-8.1
example.org.crt: OK
Chain:
depth=0: CN = *.example.org (untrusted)
depth=1: C = US, O = "DigiCert, Inc.", CN = RapidSSL G5 TLS RSA4096 SHA384 2022 CA1 (untrusted)
depth=2: C = US, O = "DigiCert, Inc.", CN = DigiCert TLS RSA4096 Root G5 (untrusted)
depth=3: C = US, O = DigiCert Inc, OU = www.digicert.com, CN = DigiCert Global Root CA

Testing cacerts/android-9.0
example.org.crt: OK
Chain:
depth=0: CN = *.example.org (untrusted)
depth=1: C = US, O = "DigiCert, Inc.", CN = RapidSSL G5 TLS RSA4096 SHA384 2022 CA1 (untrusted)
depth=2: C = US, O = "DigiCert, Inc.", CN = DigiCert TLS RSA4096 Root G5 (untrusted)
depth=3: C = US, O = DigiCert Inc, OU = www.digicert.com, CN = DigiCert Global Root CA
```

Another example where some fail validation.

```
Testing cacerts/android-4.2
C = US, O = Let's Encrypt, CN = R10
error 20 at 1 depth lookup: unable to get local issuer certificate
error example.org.crt: verification failed

Testing cacerts/android-4.4
C = US, O = Let's Encrypt, CN = R10
error 20 at 1 depth lookup: unable to get local issuer certificate
error example.org.crt: verification failed

Testing cacerts/android-6.0
C = US, O = Let's Encrypt, CN = R10
error 20 at 1 depth lookup: unable to get local issuer certificate
error example.org.crt: verification failed

Testing cacerts/android-8.1
example.org.crt: OK
Chain:
depth=0: CN = example.org (untrusted)
depth=1: C = US, O = Let's Encrypt, CN = R10 (untrusted)
depth=2: C = US, O = Internet Security Research Group, CN = ISRG Root X1

Testing cacerts/android-9.0
example.org.crt: OK
Chain:
depth=0: CN = example.org (untrusted)
depth=1: C = US, O = Let's Encrypt, CN = R10 (untrusted)
depth=2: C = US, O = Internet Security Research Group, CN = ISRG Root X1
```

If you want to test only one specific platform, then adjust the second argument to be just that platform name

```
./test-cert.sh example.org android-4.2

Testing cacerts/android-4.2
C = US, O = Let's Encrypt, CN = R10
error 20 at 1 depth lookup: unable to get local issuer certificate
error example.org.crt: verification failed
```
