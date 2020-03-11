cryptography

构造和test_03中dart相同的key

x = 'my32lengthsupersecretnooneknows1'
key = base64.urlsafe_b64encode(x.encode())

加解密均和dart相同结果