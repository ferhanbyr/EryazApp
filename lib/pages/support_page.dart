import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eryaz2/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:eryaz2/components/my_textfield.dart';
import 'package:eryaz2/pages/user_page.dart';
import 'home_page.dart';
import '../components/bottom_bar.dart';

class SupportPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  SupportPage({super.key});

  void _navigateToSupport(BuildContext context) {}

  void _navigateToPerson(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserPage()),
    );
  }

  Future<void> _sendDataToFirestore(BuildContext context) async {
    // Firestore'a verileri kaydetmek için gerekli kod
    CollectionReference tickets = FirebaseFirestore.instance.collection('tickets');

    try {
      await tickets.add({
        'email': emailController.text,
        'ad': nameController.text,
        'konu': subjectController.text,
        'mesaj': messageController.text,
        'zaman': FieldValue.serverTimestamp(), // Sunucu zamanı
      });

      // İşlem başarılı olduğunda SnackBar göster
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Gönderildi"),
          backgroundColor: Colors.black,
        ),
      );
    } catch (e) {
      // İşlem başarısız olduğunda SnackBar göster
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Veri kaydedilirken bir hata oluştu: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(128, 36, 40, 0.6),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 60),
                  child: Text(
                    "Ticket Oluştur",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                SizedBox(height: 40),
                MyTextfield(
                  controller: emailController,
                  hintText: "E-mail",
                ),
                SizedBox(height: 40),
                MyTextfield(
                  controller: nameController,
                  hintText: "Ad",
                ),
                SizedBox(height: 40),
                MyTextfield(
                  controller: subjectController,
                  hintText: "Konu",
                ),

                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    height: 200,
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color.fromARGB(255, 222, 218, 218),
                      ),
                    ),
                    child: TextField(
                      controller: messageController,
                      maxLines: null,
                      expands: true,
                      decoration: InputDecoration(
                        hintText: "Mesajınızı buraya yazın...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                MyButton(
                  onTap: () => _sendDataToFirestore(context),
                  butonText: "GÖNDER",
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: Image.asset('lib/images/logo1.png'),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBarWithFAB(
        onSupportPressed: () => _navigateToSupport(context),
        onPersonPressed: () => _navigateToPerson(context),
      ),
    );
  }
}
