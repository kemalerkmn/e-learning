// ignore_for_file: unused_local_variable, avoid_print, duplicate_ignore

import 'package:e_leaning2/screens/home_screen/home_screen.dart';
import 'package:e_leaning2/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../companete/custom_button.dart';
import '../../companete/custom_password_field.dart';
import '../../companete/custom_text_button.dart';
import '../../companete/custom_text_field.dart';
import '../../image_and_icon_path/icon_path.dart';
import '../../image_and_icon_path/image_path.dart';
import '../../service/auth.dart';
import '../log_in_screen/log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

    String name = "", email = "", password = "";
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SVGIcon.backArrow.value())),
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
                "Sign Up",
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Create your account",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                text: "Name",
                textCall: (value) {
                  // ignore: avoid_print
                  print("name alindi");
                  name = value;
                },
              ),
              const SizedBox(
                height: 15,
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
                  // ignore: avoid_print
                  print("password alindi");

                  password = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                  press: () {
                    authService
                        .createCustomer(
                            name: name, email: email, password: password)
                        .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen())));
                  },
                  tittle: "Sign up"),
              CustomTextButton(
                  text: "Log in",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogInScreen()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
