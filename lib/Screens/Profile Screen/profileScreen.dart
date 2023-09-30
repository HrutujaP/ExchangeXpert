import 'package:exchange_xpert/Constants/constant.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profileScreen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: kPrimaryColor,
        backgroundColor: kSubPrimaryColor,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.account_circle_rounded,
            size: 50,
            color: kSubSecondaryColor,
          ),
        ),
        title: const Text(
          "User Name\nMobile Number/Email id",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: kSubSecondaryColor,
          ),
        ),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Row(
                    children: [Text("AUD"),],
                  ),
                );
              })),
    );
  }
}
