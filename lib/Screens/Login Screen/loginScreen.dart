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


// class Login extends StatelessWidget {
//   const Login({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: _isVisible == true
//           ? MainAxisAlignment.center
//           : MainAxisAlignment.start,
//       children: [
//         const appInfo(),
//         _isVisible == false
//             ? SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const Text(
//                       "Welcome",
//                     ),
//                     const Text(
//                       "Let's get started!",
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 8, vertical: 16),
//                       child: TextFormField(
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                           labelText: 'Mobile Number',
//                         ),
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: const Text("Send Otp"),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: const Text("Validate"),
//                     ),
//                     const Text(
//                       "or",
//                     ),
//                     const Text(
//                       "Continue with",
//                     ),
//                   ],
//                 ),
//               )
//             : const Center(),
//       ],
//     );
//   }
// }


