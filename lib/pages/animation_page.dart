import 'package:eryaz2/pages/login_page.dart';
import 'package:flutter/material.dart';
import "package:lottie/lottie.dart";

import 'enter_pages.dart';

void main() => runApp( LoginPage(onTap: () {  },));

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const EnterPages()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(74, 79, 85, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
            'https://lottie.host/d849cc2a-1a1b-4ac4-9a2d-64139228fdb2/WPiTRPt3sg.json',
          ),
        ],
      ),
    );
  }
}