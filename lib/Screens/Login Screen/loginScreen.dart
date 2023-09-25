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
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // appInfo(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome",
                      style: TextStyle(
                        color: kSubSecondaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Let's get started!",
                      style: TextStyle(
                        color: kSubSecondaryColor,
                        fontSize: 18,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: TextField(
                        cursorColor: kPrimaryColor1,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: kSecondaryColor1,
                          fontSize: 18,
                        ),
                        decoration: kTextFieldDecoration.copyWith(
                          fillColor: kSubPrimaryColor.withOpacity(0.2),
                          hintText: "Enter your phone number",
                          labelText: "Mobile Number",
                          labelStyle: const TextStyle(
                            color: kSubSecondaryColor,
                          ),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: kPrimaryColor1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: TextField(
                        cursorColor: kPrimaryColor1,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                          color: kSecondaryColor1,
                          fontSize: 18,
                        ),
                        decoration: kTextFieldDecoration.copyWith(
                          fillColor: kSubPrimaryColor.withOpacity(0.2),
                          hintText: "Enter your password",
                          labelText: "Password",
                          labelStyle: const TextStyle(
                            color: kSubSecondaryColor,
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: kPrimaryColor1,
                          ),
                          suffixIcon: InkWell(
                            radius: BorderSide.strokeAlignCenter,
                            onTap: () {
                              setState(() {
                                _isHidden = !_isHidden;
                              });
                            },
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kPrimaryColor1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password?",
                          style: TextStyle(
                            color: kPrimaryColor1,
                          )),
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            kSubSecondaryColor,
                          ),
                        ),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: kSubPrimaryColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Sign Up",
                          style: TextStyle(
                            color: kPrimaryColor1,
                          )),
                    ),
                  ],
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


