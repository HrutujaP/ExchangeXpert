// ignore_for_file: file_names, camel_case_types

import 'package:exchange_xpert/Constants/constant.dart';
import 'package:exchange_xpert/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class loginFormFields extends StatefulWidget {
  final String hintText;
  final String labelText;
  final Icon prefixIcon;
  final String name;
  final TextEditingController controller;

  InkWell? suffixIcon;
  loginFormFields({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.hintText,
    required this.name,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.controller,
  });
  // : _formKey = formKey;

  // final GlobalKey<FormState> _formKey;

  @override
  State<loginFormFields> createState() => _loginFormFieldsState();
}

class _loginFormFieldsState extends State<loginFormFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        // height: 60,
        width: MediaQuery.of(context).size.width / 1.1,
        child: TextFormField(
          controller: widget.controller,
          onChanged: (value) {
            setState(() {
              widget.controller.text = value;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required *';
            } else {}
            return null;
          },
          cursorColor: appTheme.colorScheme.onBackground,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: appTheme.colorScheme.surface,
            fontSize: 20,
          ),
          decoration: kTextFieldDecoration.copyWith(
            fillColor: appTheme.colorScheme.onBackground.withOpacity(0.2),
            hintText: widget.hintText,
            labelText: widget.labelText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
          ),
        ),
      ),
    );
  }
}

// loginFormFields(
//                               formKey: _signUpformKey,
//                               hintText: "Enter your Password",
//                               labelText: "Password",
//                               prefixIcon: const Icon(
//                                 Icons.lock,
//                                 color: kPrimaryColor1,
//                               ),
//                               suffixIcon: InkWell(
//                                 radius: BorderSide.strokeAlignCenter,
//                                 onTap: () {
//                                   setState(() {
//                                     _isHidden = !_isHidden;
//                                   });
//                                 },
//                                 child: Icon(
//                                   _isHidden
//                                       ? Icons.visibility
//                                       : Icons.visibility_off,
//                                   color: kPrimaryColor1,
//                                 ),
//                               ),
//                               name: 'Paasword',
//                             ),
