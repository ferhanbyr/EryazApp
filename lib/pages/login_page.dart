import 'package:eryaz2/auth/auth.dart';
import 'package:eryaz2/components/my_button.dart';
import 'package:eryaz2/components/my_textfield.dart';
import 'package:eryaz2/components/square_tile.dart';
import 'package:eryaz2/helper/helper_functions.dart';
import 'package:eryaz2/pages/home_page.dart';
import 'package:eryaz2/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      displayMessageToUser('Lütfen boş alanları doldurun!', context);
      return;
    }

    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (context.mounted) {
        Navigator.pop(context); // Close the dialog
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Close the dialog
      String errorMessage;

      // Hata koduna göre özelleştirilmiş hata mesajları
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'E-posta hatalı ya da eksik tuşladınız!';
          break;
        case 'user-not-found':
          errorMessage = 'Bu e-postayla ilgili kullanıcı bulunamadı.';
          break;
        case 'wrong-password':
          errorMessage = 'Yanlış şifre girildi.';
          break;
        case 'user-disabled':
          errorMessage = 'Bu kullanıcı hesabı devre dışı bırakıldı.';
          break;
        default:
          errorMessage = 'Girilen bilgiler hatalı.Lütfen tekrar deneyin!';
      }

      displayMessageToUser(errorMessage, context);
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(74, 79, 85, 1),
      ),
      backgroundColor: Color.fromRGBO(74, 79, 85, 1),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding:  EdgeInsets.only(left: 12, top: 50),
                  child:  Text(
                    "Welcome back! Glad to see you, Again!",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 45),
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 45),
                Center(
                  child: MyButton(
                    butonText: ("Login"),
                    onTap: login
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.white54),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.6,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      imagePath: 'lib/images/google.png',
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SquareTile(
                      imagePath: 'lib/images/apple.png',
                    )
                  ],
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member?', style: TextStyle(fontSize: 17)),
                      SizedBox(
                        width: 4,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder:(context,) => RegisterPage(),));
                        },
                        child: Text('Register now',
                            style: TextStyle(color: Color.fromRGBO(240, 27, 36, 1))),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}