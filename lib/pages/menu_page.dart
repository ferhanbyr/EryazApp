import 'package:eryaz2/pages/enter_pages.dart';
import 'package:eryaz2/pages/personal_page.dart';
import 'package:eryaz2/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Ferhan BAYIR',
              style: TextStyle(fontSize: 20),
            ),
            accountEmail: const Text(
              'ferhanbayir1@gmail.com',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'lib/images/profile.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(128, 36, 40, 1),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              'P R O F İ L',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            onTap: () {
            Navigator.push(context,MaterialPageRoute(builder:(context)=>PersonalPage() ),);
            },
          ),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_outlined),
            title: const Text(
              'H A K K I M I Z D A',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            onTap: () {
              commandLaunch('https://www.eryaz.com.tr/tr/Pages/hakkimizda');
            },
          ),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            leading: const Icon(Icons.book_online_outlined),
            title: const Text(
              'P R O J E L E R İ M İ Z',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            onTap: () {
              commandLaunch('https://www.eryaz.com.tr/tr/projeler');
            },
          ),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'A Y A R L A R',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingPage()),
              );
            },
          ),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            leading: const Icon(Icons.camera_roll),
            title: const Text(
              'B A S I N D A  B İ Z',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            onTap: () {
              commandLaunch('https://www.eryaz.com.tr/tr/');
            },
          ),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            leading: const Icon(Icons.phone_callback),
            title: const Text(
              'İ L E T İ Ş İ M',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            onTap: () {
              commandLaunch('https://www.eryaz.com.tr/tr/iletisim');
            },
          ),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              'Ç I K I Ş  Y A P',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            onTap: () {
              // Girişe yönlendir
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EnterPages()),
              );
            },
          )
        ],
      ),
    );
  }

  void commandLaunch(String command) async {
    final Uri url = Uri.parse(command);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      print('Could not launch $command');
    }
  }

}
