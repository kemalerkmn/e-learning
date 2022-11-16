// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_element, no_leading_underscores_for_local_identifiers, duplicate_ignore
import 'package:flutter/material.dart';

import '../../companete/custom_button.dart';
import '../log_in_screen/log_in_screen.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    void nextPageController() {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOutQuart);
    }

// easeoutbacg easeInOutCubicEmphasized
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LogInScreen()));
            },
            child: Text(
              "Skip",
              style: Theme.of(context).textTheme.subtitle2,
            ))
      ]),
      body: PageView(
        controller: _pageController,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          IntroPage(
            image: IntroImage.page1.image(),
            press: nextPageController,
            title: IntroHeadline.page1.title(),
            subtittle: IntroSubline.page1.subtitle(),
            buttonTittle: "Next",
          ),
          IntroPage(
            image: IntroImage.page2.image(),
            press: nextPageController,
            title: IntroHeadline.page2.title(),
            subtittle: IntroSubline.page2.subtitle(),
            buttonTittle: "Next",
          ),
          IntroPage(
            image: IntroImage.page3.image(),
            press: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LogInScreen()));
            },
            title: IntroHeadline.page3.title(),
            subtittle: IntroSubline.page3.subtitle(),
            buttonTittle: "Let’s Start",
          ),
        ],
      ),
    );
  }
}

class IntroPage extends StatelessWidget {
  const IntroPage({
    Key? key,
    required this.buttonTittle,
    required this.image,
    required this.subtittle,
    required this.title,
    required this.press,
  }) : super(key: key);
  final Widget image;
  final String title, subtittle, buttonTittle;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          image,
          Text(
            title,
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
          Text(
            subtittle,
            style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
          CustomButton(press: press, tittle: buttonTittle)
        ],
      ),
    );
  }
}

enum IntroImage { page1, page2, page3 }

extension IntroImageExtension on IntroImage {
  Widget image() {
    switch (this) {
      case IntroImage.page1:
        return Image.asset("assets/img/img_intro_1.png");
      case IntroImage.page2:
        return Image.asset("assets/img/img_intro_2.png");
      case IntroImage.page3:
        return Image.asset("assets/img/img_intro_3.png");
    }
  }
}

enum IntroHeadline { page1, page2, page3 }

extension IntroHeadlineExtension on IntroHeadline {
  String title() {
    switch (this) {
      case IntroHeadline.page1:
        return "Learn anything and anywhere";
      case IntroHeadline.page2:
        return "Find a course for you";
      case IntroHeadline.page3:
        return "Improve your skills";
    }
  }
}

enum IntroSubline { page1, page2, page3 }

extension IntroSublineExtension on IntroSubline {
  String subtitle() {
    switch (this) {
      case IntroSubline.page1:
        return "Quarantine is the perfect time to spend yourday learning something new, from anywhere!";
      case IntroSubline.page2:
        return "Make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged";
      case IntroSubline.page3:
        return "Years old. Richard McClintock, a Latin professor at Hampden-Sydney College in";
    }
  }
}
