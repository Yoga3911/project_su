import 'package:project/data/models/auth/login_model.dart';
import 'package:project/data/models/auth/register_model.dart';

abstract class SocialService {
  Future<void> signUp({required RegisterModel registerModel});
  Future<dynamic> signIn({required LoginModel loginModel});
  Future<void> signOut();
}
