import 'package:flutter/material.dart';

class BottomNavigationBarWithFAB extends StatefulWidget {
  final Function onSupportPressed;
  final Function onPersonPressed;

  BottomNavigationBarWithFAB({
    required this.onSupportPressed,
    required this.onPersonPressed,
  });

  @override
  _BottomNavigationBarWithFABState createState() => _BottomNavigationBarWithFABState();
}

class _BottomNavigationBarWithFABState extends State<BottomNavigationBarWithFAB> {


  void _onPersonIconPressed() {
    setState(() {

    });
    widget.onPersonPressed();
  }

  void _onSupportIconPressed() {
    setState(() {

    });
    widget.onSupportPressed();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Color.fromRGBO(128, 36, 40, 0.4),
      notchMargin: 10.0,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Transform.translate(
            offset: Offset(40, 0), // İkonu sağa kaydırmak için x ekseninde 40 birim hareket ettiriyoruz
            child: IconButton(
              highlightColor: Colors.black,
              icon: Icon(
                Icons.person,
                size: 38,
                color: Colors.white,

              ),
              onPressed: _onPersonIconPressed,
            ),
          ),
    Transform.translate(
    offset: Offset(-40, 0),// İkonu sola kaydırmak için x ekseninde -40 birim hareket ettiriyoruz
          child: IconButton(
            highlightColor: Colors.black,

            icon: Icon(
              Icons.support_agent,
              size: 38,
              color: Colors.white,
            ),
            onPressed: _onSupportIconPressed,
          ),
    ),
        ],
      ),
    );
  }
}
