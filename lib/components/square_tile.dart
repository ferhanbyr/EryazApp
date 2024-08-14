import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Color.fromRGBO(74, 79, 85, 1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white24)),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 38,
            width: 72,
          ),
        ],
      ),
    );
  }
}
//burayı logolar için tasarladım ve login page de çağırdım

