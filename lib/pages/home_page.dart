import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'content_page.dart';

class TitlesPage extends StatefulWidget {
  @override
  _TitlesPageState createState() => _TitlesPageState();
}

class _TitlesPageState extends State<TitlesPage> {
  List<dynamic> contents = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final jsonString = await rootBundle.rootBundle.loadString('assets/data.json');
    final jsonResponse = json.decode(jsonString);
    setState(() {
      contents = jsonResponse['hajj_tutorial'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hajj Tutorial Titles'),
      ),
      body: contents.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: contents.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contents[index]['title']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContentPage(
                    title: contents[index]['title'],
                    content: contents[index]['content'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
