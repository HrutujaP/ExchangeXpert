import 'package:exchange_xpert/Screens/Home%20Screen/homeScreen.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/loginScreen.dart';
import 'package:exchange_xpert/Screens/WelcomeScreen/welcomeScreen.dart';
import 'package:exchange_xpert/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // _firestore.collection('Login Credentials').doc('Combination 1').set({
  //   "Email": "abc@gmail.com",
  //   "Password": "12345678",
  // });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
      },
      // initialRoute: WelcomeScreen.id,
      initialRoute: HomeScreen.id,
      home: const WelcomeScreen(),
    );
  }
}
