import 'package:flutter/material.dart';
import 'package:tokoperabot/login_screen.dart';
import 'package:tokoperabot/model/user.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tokoperabot',
      home: LoginScreen(),
    );
  }
}
