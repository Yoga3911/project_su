import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/constants/collection.dart';
import 'package:project/data/models/auth/login_model.dart';
import 'package:project/data/models/auth/register_model.dart';
import 'package:project/data/models/user/user_model.dart';
import 'package:project/utils/hash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'abs_auth_service.dart';

class EmailService extends SocialService {
  @override
  Future<void> signUp({required RegisterModel registerModel}) async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      final doc = MyCollection.users.doc();
      await doc.set(
        RegisterModel(
          userId: doc.id,
          username: registerModel.username,
          password: registerModel.password,
          createdAt: registerModel.createdAt,
          updatedAt: registerModel.updatedAt,
        ).toJson(),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<dynamic> signIn({required LoginModel loginModel}) async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      final data = await MyCollection.users
          .where("username", isEqualTo: loginModel.username)
          .get() as QuerySnapshot<Map<String, dynamic>>;
      if (data.docs.isEmpty) {
        return "Nama Pengguna atau Kata Sandi salah";
      } else if (data.docs.isNotEmpty &&
          data.docs.first.data()["password"] != hashPass(loginModel.password)) {
        return "Nama Pengguna atau Kata Sandi salah";
      }

      final userModel = UserModel.fromJson(data.docs.first.data());

      return userModel;
    } catch (e) {
      log(e.toString());
      return e.toString();
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      final pref = await SharedPreferences.getInstance();
      pref.clear();
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
