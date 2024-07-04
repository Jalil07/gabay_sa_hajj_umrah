import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:provider/provider.dart';
import '../providers/font_size_provider.dart';
import 'content_page.dart';

class TitlesPage extends StatefulWidget {
  const TitlesPage({super.key});

  @override
  State<TitlesPage> createState() => _TitlesPageState();
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ),
              title: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double top = constraints.biggest.height;
                  return Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 9.0),
                    child: Consumer<FontSizeProvider>(
                      builder: (context, fontSizeProvider, child) {
                        return Text(
                          'Gabay sa Hajj at Umrah',
                          style: TextStyle(
                            color: const Color(0xff70394B),
                            fontSize: top > 100 ? 14 : 18,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Consumer<FontSizeProvider>(
                        builder: (context, fontSizeProvider, child) {
                          return Text(
                            contents[index]['title'],
                            style: TextStyle(fontSize: fontSizeProvider.fontSize),
                          );
                        },
                      ),
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
                    ),
                    if (index < contents.length - 1) const Divider(),
                  ],
                );
              },
              childCount: contents.length,
            ),
          ),
        ],
      ),
    );
  }
}
