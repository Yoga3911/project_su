import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String hashPass(String password) {
  final key = utf8.encode(dotenv.get("HASH_KEY"));
  final bytes = utf8.encode(password);

  final hmacSha256 = Hmac(sha256, key);
  final digest = hmacSha256.convert(bytes);

  return digest.toString();
}
