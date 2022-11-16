// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:e_leaning2/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../../companete/custom_button.dart';
import '../../companete/custom_password_field.dart';
import '../../companete/custom_text_button.dart';
import '../../companete/custom_text_field.dart';
import '../../image_and_icon_path/image_path.dart';
import '../../image_and_icon_path/social_media_icons_path.dart';
import '../../service/auth.dart';
import '../sign_up_screen/sign_up_screen.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    String email = "", password = "";
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlobalImage.MainIcon.image(),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Log in",
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Login with social networks",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        _authService.signInWithFacebook();
                      },
                      icon: SocialMediaIcons.facebook.icon()),
                  IconButton(
                      onPressed: () {
                        _authService.signInWithGoogle();
                      },
                      icon: SocialMediaIcons.google.icon()),
                  IconButton(
                      onPressed: () {}, icon: SocialMediaIcons.twitter.icon()),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                text: "Email",
                textCall: (value) {
                  // ignore: avoid_print
                  print("mail alindi");

                  email = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomPasswordField(
                textCall: (value) {
                  password = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextButton(
                text: "Forgot Password?",
                press: () {},
              ),
              CustomButton(
                  press: () {
                    _authService.signIn(email, password).then((value) =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen())));
                  },
                  tittle: "Log in"),
              CustomTextButton(
                  text: "Sign up",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable

