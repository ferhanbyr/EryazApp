import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  final Function()? onTap;
  final String boxText;
  final String boxImage;

  const MyBox({super.key, required this.onTap, required this.boxText, required this.boxImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(boxImage),fit: BoxFit.cover  ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              height: 180,
              width: 180,
              decoration:BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),

              child:  Center(
                child: Text(
                  boxText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
//burayı home daki resim boxlari için tasarladım
