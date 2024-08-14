import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/item_model.dart'; // ItemModel sınıfı

class DetailPage extends StatefulWidget {
  final int itemId;

  DetailPage({required this.itemId});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<ItemModel> item;

  @override
  void initState() {
    super.initState();
    item = fetchItem(widget.itemId);
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await http.get(Uri.parse('https://raw.githubusercontent.com/alibnsz/test/main/data.json'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final itemData = data[id];
      return ItemModel(
        title: itemData['title'],
        description: itemData['description'],
        imageUrl: itemData['imageUrl'],
      );
    } else {
      throw Exception('Failed to load item');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromRGBO(128, 36, 40, 1),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<ItemModel>(
          future: item,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return Center(child: Text('No data'));
            } else {
              final item = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(item.imageUrl),
                    SizedBox(height: 16.0),
                    Text(item.title, style: Theme.of(context).textTheme.headlineSmall),
                    SizedBox(height: 8.0),
                    Text(item.description, style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
//bu sayfayı myboxlara tıklandığında detay versin diye tasarladım