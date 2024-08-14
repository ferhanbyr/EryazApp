import 'package:flutter/material.dart';

class MyChoice extends StatelessWidget {
  final Function()? onTap;
  final String butonText;
  const MyChoice({super.key, required this.onTap, required this.butonText});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 370,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: Border(bottom: BorderSide(color: Colors.white70)),
          color: Colors.transparent,
        ),
        child: Text(
          butonText,
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
//BU sayfayı user ve ayarlarda gelen seçenekler için tasarladım ve usera bağladım
