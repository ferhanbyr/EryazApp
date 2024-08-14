import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String butonText;

  const MyButton({super.key, this.onTap, required this.butonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(167, 7, 15, 0.667)),
        child:  Center(
          child: Text(butonText ,style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
            ),
          ),
        ),

    );
  }
}
//bu sayfayı register login butonları için tasarladim ve bunları login ve register sayfalarında kullandım