import 'dart:convert';

import 'package:encrypt/encrypt.dart';

void main() {
  final plainText = '360102197001012880';
  final key = Key.fromUtf8('my32lengthsupersecretnooneknows1');

  final b64key = Key.fromUtf8(base64Url.encode(key.bytes));
  // if you need to use the ttl feature, you'll need to use APIs in the algorithm itself
  print(key.bytes);
  print(base64Url.encode(key.bytes));

  final fernet = Fernet(b64key);
  final encrypter = Encrypter(fernet);

  final encrypted = encrypter.encrypt(plainText);
  final decrypted = encrypter.decrypt(encrypted);

  print(encrypted);
  print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
  print(encrypted.base64); // random cipher text
  print(fernet.extractTimestamp(encrypted.bytes)); // unix timestamp

  final x = Encrypted.fromBase64('gAAAAABeaE+AGCtJipEjfS4q9WoXW3lvGKsLh7r4vOjWefSOJa5MDX377bNm9i+ivSW65p3rjKikCcsPYnyNLjB0XV8nR5UZXSyCJxKdDhJeop7SmMgt+JM=');
  final y = encrypter.decrypt(x);
  print(y);

}