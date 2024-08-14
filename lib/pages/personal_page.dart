import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  // Firestore'dan veri çektim
  final User? user = FirebaseAuth.instance.currentUser;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Firestore'dan veriyi çekme ve TextField'ları doldurma
  Future<void> _getUserData() async {
    if (user != null) {
      // E-posta'yı Firebase Authentication'dan çekme
      _emailController.text = user!.email ?? '';

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          _usernameController.text = userDoc['username'] ?? '';
          _passwordController.text = userDoc['password'] ?? '';
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getUserData(); // Sayfa yüklendiğinde verileri çek
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(128, 36, 40, 1),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.question_mark,
                color: Colors.white,
              ), // Burada Icon widget'ı kullanılıyor
              onPressed: () {
                commandLaunch('https://www.eryaz.com.tr/tr/iletisim');
              },// Butona tıklanınca yapılacak işlemler
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 12, top: 10, bottom: 20),
                  child: Text(
                    "Kişisel Bilgiler",
                    style: TextStyle(fontSize: 35, color: Colors.black),
                  ),
                ),
                ListTile(
                  title: Text("Kullanıcı Adı"),
                  subtitle: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(hintText: "Kullanıcı adınızı girin"),
                  ),
                ),
                ListTile(
                  title: Text("E-posta"),
                  subtitle: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: "E-posta adresinizi girin"),
                    readOnly: true, // E-posta sadece görünür
                  ),
                ),
                ListTile(
                  title: Text("Şifre"),
                  subtitle: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(hintText: "Şifrenizi girin"),
                    obscureText: true, // Şifre gizli olarak gösterilecek
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Değişiklikleri kaydetme işlemi
                    _saveChanges();
                  },
                  child: Text("Değişiklikleri Kaydet",style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Değişiklikleri Firestore'a kaydetme fonksiyonu
  Future<void> _saveChanges() async {
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
        'username': _usernameController.text,
        'password': _passwordController.text,
      });

      // E-posta Firebase Authentication'da değiştirilemez; bu yüzden burada güncellemiyoruz.
    }
  }
}
void commandLaunch(String command) async {
  final Uri url = Uri.parse(command);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    print('Could not launch $command');
  }
}//url için oluşturlumuş fonksiyon


