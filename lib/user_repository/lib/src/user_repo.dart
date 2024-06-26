import 'package:firebase_auth/firebase_auth.dart';
import 'package:planner/user_repository/lib/src/models/models.dart';

abstract class UserRepository {
  Stream<User?> get user;
  Future<void> signIn(String email, String password);
  Future<void> logOut();
  Future<MyUser> signUp(MyUser myUser, String password);
  Future<void> resetPassword(String email);
  Future<void> setUserData(MyUser user);
  Future<MyUser> getUserData(String myUserId);
}