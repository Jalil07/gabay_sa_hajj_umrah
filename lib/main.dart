import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(HajjTutorialApp());
}

class HajjTutorialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hajj Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TitlesPage(),
    );
  }
}
