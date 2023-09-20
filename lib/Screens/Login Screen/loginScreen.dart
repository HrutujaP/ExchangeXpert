import 'dart:async';

import 'package:exchange_xpert/Components/AppInfo.dart';
import 'package:exchange_xpert/Constants/constant.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const id = 'loginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool containerAnimation = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // appInfo(),
              Text(
                "Welcome",
              ),
              Text(
                "Le's get started!",
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Mobile Number',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
