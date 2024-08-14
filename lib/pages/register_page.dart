import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eryaz2/components/my_button.dart';
import 'package:eryaz2/components/my_textfield.dart';
import 'package:eryaz2/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eryaz2/helper/helper_functions.dart';
class RegisterPage extends StatefulWidget {
   RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
   final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

   final confirmPwController = TextEditingController();

   Future<void> registerUser() async {
     // Yüklenme göstergesi göstermek için dialog aç
     showDialog(
       context: context,
       builder: (context) => const Center(
         child: CircularProgressIndicator(),
       ),
     );

     // Şifrelerin eşleştiğini kontrol et
     if (passwordController.text != confirmPwController.text) {
       Navigator.pop(context);
       displayMessageToUser("Şifreler eşleşmiyor!", context); // Hata mesajı
       return;
     }

     try {
       // Firebase Authentication ile kullanıcı oluştur
       UserCredential userCredential = await FirebaseAuth.instance
           .createUserWithEmailAndPassword(
         email: emailController.text,
         password: passwordController.text,
       );

       // Kullanıcı oluşturulduktan sonra kullanıcı verilerini al
       User? user = userCredential.user;

       if (user != null) {
         // Firestore'da 'users' koleksiyonuna yeni bir belge oluştur ve kullanıcı bilgilerini kaydet
         await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
           'username': usernameController.text,
           'email': emailController.text,
           'createdAt': DateTime.now(),
           'uid': user.uid,
           // Diğer eklemek istediğiniz kullanıcı bilgileri
         });

         Navigator.pop(context); // Dialogu kapat

         // Kayıt başarılı olduğunda anasayfaya yönlendir
         if (context.mounted) {
           Navigator.pushReplacement(
             context,
             MaterialPageRoute(builder: (context) => LoginPage(onTap: () {  },)),
           );
         }
       }
     } on FirebaseAuthException catch (e) {
       Navigator.pop(context);
       displayMessageToUser(e.message ?? "Bir hata oluştu.", context);
     }
   }

   @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(74, 79, 85, 1),
      ),
      backgroundColor: Color.fromRGBO(74, 79, 85, 1),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
                horizontal: 10), // Add padding to the sides
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the content
              children: [
                const Padding(
                  padding: const EdgeInsets.only(left: 12, top: 70),
                  child: const Text(
                    "Welcome back!Glad to see you, Again!",
                    style: TextStyle(fontSize: 35,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 45),
                MyTextfield(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(height: 25),
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
                const SizedBox(height: 26),
                MyTextfield(
                  controller: confirmPwController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 45),
                //butonu mybuttondan cagitdim
                Center(
                  child: MyButton(
                    butonText:("Register"),
                    onTap:registerUser
                        /*(){
                      //homepage sayfasına bağladim
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  HomePage()),
                      );
                    },
                  ),*/
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                const SizedBox(height: 50),
                 Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Are you a member?', style: TextStyle(fontSize: 17)),
                      SizedBox(
                        width: 4,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(onTap: () {  },),));
                        },
                        child: Text('Login now',
                            style: TextStyle(color: Color.fromRGBO(133, 35, 39,
                                1.0))),
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
