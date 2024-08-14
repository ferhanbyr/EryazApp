import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../components/my_box.dart';
import 'detail_page.dart';
import '../model/item_model.dart';
import 'menu_page.dart';
import 'support_page.dart';
import 'user_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ItemModel> items = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://raw.githubusercontent.com/alibnsz/test/main/data.json'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        items = data.map((json) => ItemModel(
          title: json['title'],
          description: json['description'],
          imageUrl: json['imageUrl'],
        )).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuPage(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromRGBO(128, 36, 40, 1),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.sublist(0, 2).map((item) {
              return MyBox(
                boxImage: item.imageUrl,
                boxText: item.title,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(itemId: items.indexOf(item)),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.sublist(2, 4).map((item) {
              return MyBox(
                boxImage: item.imageUrl,
                boxText: item.title,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(itemId: items.indexOf(item)),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.sublist(4, 6).map((item) {
              return MyBox(
                boxImage: item.imageUrl,
                boxText: item.title,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(itemId: items.indexOf(item)),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        backgroundColor: Colors.transparent,
        child: Image.asset(
          'lib/images/logo1.png',
          height: 60,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color.fromRGBO(128, 36, 40, 1),
        notchMargin: 10.0,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Transform.translate(
              offset: Offset(40, 0),
              child: IconButton(
                icon:const  Icon(
                  Icons.person,
                  size: 38,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserPage()),
                  );
                },
              ),
            ),
            Transform.translate(
              offset: Offset(-40, 0),
              child: IconButton(
                icon: const Icon(
                  Icons.support_agent,
                  size: 38,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SupportPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
