// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import '../radius_and_padding_utility/radius_utility.dart';

class CustomPasswordField extends StatelessWidget {
  Function(String) textCall;
  CustomPasswordField({
    Key? key,
    required this.textCall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: TextField(
        style: Theme.of(context).textTheme.bodyText1,
        onSubmitted: ((value) {
          textCall.call(textController.text);
        }),
        controller: textController,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
            hintText: "Password",
            suffixIcon: const Icon(Icons.visibility_outlined,
                color: Color.fromRGBO(116, 101, 228, 1)),
            suffixIconColor: const Color.fromRGBO(116, 101, 228, 1),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black45, width: 2),
              borderRadius: RadiusUtility.minradius,
            ),
            border: OutlineInputBorder(
                borderRadius: RadiusUtility.minradius,
                // ignore: prefer_const_constructors
                borderSide: BorderSide(
                    width: .4, color: const Color.fromRGBO(242, 242, 242, 1)))),
      ),
    );
  }
}
