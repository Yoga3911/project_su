import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/constants/collection.dart';
import 'package:project/data/models/auth/login_model.dart';
import 'package:project/data/models/auth/register_model.dart';
import 'package:project/data/models/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'abs_auth_service.dart';

class EmailService extends SocialService {
  @override
  Future<void> signUp({required RegisterModel registerModel}) async {
    await FirebaseAuth.instance.signInAnonymously();
    final doc = MyCollection.users.doc();
    await doc.set(
      RegisterModel(
        userId: doc.id,
        username: registerModel.username,
        password: registerModel.password,
        fullName: registerModel.fullName,
        isAdmin: false,
        createdAt: registerModel.createdAt,
        updatedAt: registerModel.updatedAt,
      ).toJson(),
    );
  }

  @override
  Future<dynamic> signIn({required LoginModel loginModel}) async {
    await FirebaseAuth.instance.signInAnonymously();
    final data = await MyCollection.users
        .where("username", isEqualTo: loginModel.username)
        .get() as QuerySnapshot<Map<String, dynamic>>;
    if (data.docs.isEmpty) {
      return "Nama Pengguna atau Kata Sandi salah";
    } else if (data.docs.isNotEmpty &&
        data.docs.first.data()["password"] != (loginModel.password)) {
      return "Nama Pengguna atau Kata Sandi salah";
    }

    final userModel = UserModel.fromJson(data.docs.first.data());

    return userModel;
  }

  @override
  Future<bool> signOut() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    await FirebaseAuth.instance.signOut();
    return true;
  }
}
