import 'package:eryaz2/pages/home_page.dart';
import 'package:eryaz2/pages/login_page.dart';
import 'package:eryaz2/pages/register_page.dart';
import 'package:flutter/material.dart';

class EnterPages extends StatelessWidget {
  const EnterPages({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/background.jpg'),
            fit: BoxFit.cover, // Ekrana tam oturmasını sağlamak için
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20), // Padding for sides and bottom
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end, // Butonların en altta kalmasını sağlar
            children: [
              // Butonlar
              InkWell(
                onTap: () {
                 Navigator.push(
                    context,
                     MaterialPageRoute(builder: (context) =>  LoginPage(onTap: () {  },)),
                  );
                },
                child: Container(
                  padding:const EdgeInsets.all(25),
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromRGBO(167, 7, 15, 0.667)),
                  child: const Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24), // Butonlar arasındaki boşluk
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(25),
                  height: 68,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: const Center(
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          color: Color.fromRGBO(167, 7, 15, 0.667),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              // Boşluk
              const SizedBox(height: 175), // Butonlar ile yazı arasındaki boşluk
              // Yazı
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  HomePage()),
                  );
                }, // Misafir olarak devam etmek için yapılacak işlemler
                child: const Text(
                  'Misafir olarak devam et',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
                ],
              ),

          ),
        ),
      );

  }
}
