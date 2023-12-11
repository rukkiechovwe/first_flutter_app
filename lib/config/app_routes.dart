import 'package:flutter_application_1/pages/edit_profile_page.dart';
// import 'package:flutter_application_1/pages/gorgeous_login.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/main_page.dart';
import 'package:flutter_application_1/pages/signup_page.dart';

class AppRoutes {
  static final pages = {
    signup: (context) => SignupPage(),
    login: (context) => LoginPage(),
    home: (context) => const HomePage(),
    main: (context) => const MainPage(),
    editProfile: (context) => const EditProfilePage(),
  };

  static const signup = '/signup';
  static const login = '/login';
  static const home = '/home';
  static const main = '/main';
  static const editProfile = '/edit-profile';
}
