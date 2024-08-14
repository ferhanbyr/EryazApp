import 'package:eryaz2/pages/home_page.dart';
import 'package:eryaz2/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return RegisterPage();
          }
        },
      ),
    );
  }
}
//kullanıcın oturum açıp açmadığına göre sayfa yönlendirmesi yapan sayfa