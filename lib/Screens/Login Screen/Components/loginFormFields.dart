import 'package:exchange_xpert/Constants/constant.dart';
import 'package:flutter/material.dart';

class loginFormFields extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Icon prefixIcon;
  InkWell? suffixIcon;
   loginFormFields({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        // height: 60,
        width: MediaQuery.of(context).size.width / 1.1,
        child: TextFormField(
          onChanged: (value) {
            _formKey.currentState!.validate();
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required *';
            }
            return null;
          },
          cursorColor: kPrimaryColor1,
          keyboardType: TextInputType.text,
          style: const TextStyle(
            color: kSecondaryColor1,
            fontSize: 18,
          ),
          decoration: kTextFieldDecoration.copyWith(
            fillColor: kSubPrimaryColor.withOpacity(0.2),
            hintText: hintText,
            labelText: labelText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
