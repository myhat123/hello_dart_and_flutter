增加encrypt加解密库
=================

dependencies:
  encrypt: ^4.0.0

参考资料
https://github.com/leocavalcante/encrypt/blob/master/example/fernet.dart

https://github.com/leocavalcante/encrypt/blob/master/lib/src/encrypted.dart

了解 Encrypted 类
================

拿到加密串后，需要调用 Encrypted.fromBase64
然后再解密出原串