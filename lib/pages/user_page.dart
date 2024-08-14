import 'package:eryaz2/pages/personal_page.dart';
import 'package:eryaz2/pages/support_page.dart';
import 'package:flutter/material.dart';

import '../components/bottom_bar.dart';
import '../components/my_choice.dart';
import 'home_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  void _navigateToSupport(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SupportPage()),
    );
  }

  void _navigateToPerson(BuildContext context) {
    // Person sayfasına gitme işlemi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(128, 36, 40, 0.6),
      resizeToAvoidBottomInset: false, // Prevent the FAB from moving up
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                MyChoice(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PersonalPage()),
                      );
                    },
                    butonText: "KİŞİSEL BİLGİLER"),
                MyChoice(onTap: () {}, butonText: "BİLDİRİMLER"),
                MyChoice(onTap: () {}, butonText: "HESAP BİLGİSİ"),
                MyChoice(onTap: () {}, butonText: "BİZE ULAŞIN"),

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
        child: Image.asset('lib/images/logo1.png'), // Logonuzun yolu
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
