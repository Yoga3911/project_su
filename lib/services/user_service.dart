import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/data/models/user/user_forgot_password.dart';
import 'package:project/data/models/user/user_model.dart';
import 'package:project/utils/hash.dart';

import '../constants/collection.dart';

class UserService {
  Future<bool> getByUsername({required String username}) async {
    await FirebaseAuth.instance.signInAnonymously();
    final data =
        await MyCollection.users.where("username", isEqualTo: username).get();

    if (data.docs.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<UserModel> getById({required String userId}) async {
    final data =
        await MyCollection.users.where("userId", isEqualTo: userId).get();

    return UserModel.fromJson((data.docs.first.data() as Map<String, dynamic>));
  }

  Future<dynamic> getByNIK({required String nik}) async {
    final data = await MyCollection.users.where("nik", isEqualTo: nik).get();

    return UserModel.fromJson(
      (data.docs.first.data() as Map<String, dynamic>),
    );
  }

  Future<dynamic> getDataByUsername({required String username}) async {
    final data =
        await MyCollection.users.where("username", isEqualTo: username).get();

    return UserModel.fromJson((data.docs.first.data() as Map<String, dynamic>));
  }

  Future<bool> checkData({
    required String username,
    required String password,
  }) async {
    final data = await getDataByUsername(
      username: username,
    );

    MyCollection.users.doc(data.userId).update(
          UserForgotPassword(
            password: hashPass(password),
            updatedAt: DateTime.now().millisecondsSinceEpoch,
          ).toJson(),
        );
    return true;
  }
}
