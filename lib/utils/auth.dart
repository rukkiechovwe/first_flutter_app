import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGuard {
  // ---------------------save user login state
  Future<void> saveLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
  }

  // ---------------------get user login state
  Future<bool> isAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  // ---------------------user signup
  Future<UserCredential?> createAccount(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      saveLoginState();
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        var error = 'The password provided is too weak.';
        return Future.error(error);
      } else if (e.code == 'email-already-in-use') {
        var error = 'The account already exists for that email.';
        return Future.error(error);
      }
    } catch (e) {
      return Future.error(e);
    }
    return null;
  }

  // ---------------------user login
  Future<UserCredential?> userLogin(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      saveLoginState();
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        var error = 'No user found for that email.';
        print('===================error from auth.dart  $error');
        return Future.error(error);
      } else if (e.code == 'wrong-password') {
        var error = 'Wrong password provided for that user.';
        print('===================error from auth.dart  $error');

        return Future.error(error);
      }
    } catch (e) {
      print('===================error from auth.dart (caught error)  $e');

      return Future.error(e);
    }
    return null;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
  }
}
