import 'package:exchange_xpert/Constants/constant.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/loginScreen.dart';
import 'package:exchange_xpert/Screens/Welcome%20Screen/welcomeScreen.dart';
import 'package:exchange_xpert/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/Profile Screen/profileScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

ThemeData appTheme = LightTheme;
// ThemeData appTheme = DarkTheme;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(),
          useMaterial3: true,
        ),
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          WelcomeScreen.id: (context) => const WelcomeScreen(),
          ProfileScreen.id: (context) => const ProfileScreen(),
        },
        // initialRoute: LoginScreen.id,
        // initialRoute: HomeScreen.id,
        initialRoute: ProfileScreen.id,
        home: const WelcomeScreen(),
      ),
    );
  }
}
