// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../radius_and_padding_utility/radius_utility.dart';

class CustomTextField extends StatefulWidget {
  String? text;
  Function(String) textCall;
  CustomTextField({
    Key? key,
    this.text,
    required this.textCall,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: TextField(
        style: Theme.of(context).textTheme.bodyText1,
        onSubmitted: (value) {
          widget.textCall.call(textController.text);
        },
        controller: textController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: widget.text,
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
