// ignore_for_file: invalid_use_of_protected_member

import 'package:exchange_xpert/Constants/constant.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/loginScreen.dart';
import 'package:exchange_xpert/Screens/Welcome%20Screen/welcomeScreen.dart';
import 'package:exchange_xpert/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

ThemeData appTheme = LightTheme;
// ThemeData appTheme = DarkTheme;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setTheme(BuildContext context, ThemeData newTheme) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setState(() {
      appTheme = newTheme;
    });
  }
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    User? user;
    user = FirebaseAuth.instance.currentUser;

    return Theme(
      data: appTheme,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: appTheme,
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(user: user,),
          // ProfileScreen.id: (context) =>  ProfileScreen(user: user),
          // HomeScreen.id: (context) => HomeScreen(user: user),
        },
        initialRoute: WelcomeScreen.id,
        // initialRoute: HomeScreen.id,
        // initialRoute: ProfileScreen.id,
        home:WelcomeScreen(user: user,),
      ),
    );
  }
}
