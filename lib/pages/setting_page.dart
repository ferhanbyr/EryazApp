import 'package:flutter/material.dart';

import '../components/my_choice.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color.fromRGBO(128, 36, 40, 0.6),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                MyChoice(onTap: () {}, butonText: "CİHAZ AYARLARI"),
                MyChoice(onTap: () {}, butonText: "DİL AYARLARI"),
                MyChoice(onTap: () {}, butonText: "BÜLTEN"),
                MyChoice(onTap: () {}, butonText: "GİZLİLİK"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
