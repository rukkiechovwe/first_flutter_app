import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_application_1/components/app_button.dart';
import 'package:flutter_application_1/components/app_text_field.dart';
import 'package:flutter_application_1/components/log_in_with_button.dart';
import 'package:flutter_application_1/config/app_strings.dart';
import 'package:flutter_application_1/styles/app_color.dart';
import 'package:flutter_application_1/styles/app_text.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _hiddenPasswordText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Text(AppStrings.hellowWelcome, style: AppText.header1),
                  const SizedBox(height: 16),
                  const Text(AppStrings.signupText, style: AppText.subTitle1),
                  const Spacer(),
                  AppTextField(
                    hint: AppStrings.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '${AppStrings.email} is required';
                      }
                      if (!validator.email(value)) {
                        return 'Please enter a valid ${AppStrings.email}';
                      }

                      return null;
                    },
                    // onChanged: (value) {
                    //   email = value;
                    // },
                    controller: _emailController,
                  ),
                  const SizedBox(height: 32),
                  AppTextField(
                    hint: AppStrings.password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '${AppStrings.password} is required';
                      }
                      if (value.length < 8) {
                        return '${AppStrings.password} should be at least 8 characters.';
                      }

                      return null;
                    },
                    // onChanged: (value) {
                    //   password = value;
                    // },
                    controller: _passwordController,
                    obscureText: _hiddenPasswordText,
                    suffixIcon: GestureDetector(
                      onTap: _toggleShowPassword,
                      child: Icon(
                        _hiddenPasswordText
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        size: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        print(AppStrings.forgotPassword);
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: AppColor.primary),
                      child: const Text(
                        AppStrings.forgotPassword,
                        style: AppText.body1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  AppButton(
                    text: AppStrings.signup,
                    onPressed: () => handleSignup(),
                  ),
                  const Spacer(),
                  const Text(AppStrings.orSignInWith, style: AppText.subTitle2),
                  const SizedBox(height: 22),
                  const LoginWithButton(text: AppStrings.loginWithGoogle),
                  const SizedBox(height: 12),
                  const LoginWithButton(text: AppStrings.loginWithFacebook),
                  const SizedBox(height: 22),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.alreadyHaveAccount,
                        style: TextStyle(color: AppColor.font2),
                      ),
                      SizedBox(width: 4),
                      // when user clicks login take user to login page

                      Text(AppStrings.login, style: AppText.subTitle3)
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> handleSignup() async {
    // handleSignup() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(
          'email ${_emailController.text}, password ${_passwordController.text}');
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        print(await credential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  void _toggleShowPassword() {
    setState(() {
      _hiddenPasswordText = !_hiddenPasswordText;
    });
  }
}
