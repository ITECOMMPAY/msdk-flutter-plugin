import 'dart:convert';

import 'package:crypto/crypto.dart';

class SignatureGenerator {
  static String generateSignature(String paramsToSign, String secret) {
    String signature = '';

    try {
      signature = _hMAC(paramsToSign, secret);
    } on Exception catch (e) {
      print(e);
    }

    return signature;
  }

  static String _hMAC(String value, String key) {
    final utf8Encoder = utf8.encode(key);
    final hmacSha512 =
        Hmac(sha512, utf8Encoder); // Используем пакет 'crypto' для SHA512
    final digest = hmacSha512.convert(utf8.encode(value)).bytes;
    return base64Encode(digest); // Используем пакет 'convert' для Base64
  }
}
