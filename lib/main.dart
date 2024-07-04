import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const HajjTutorialApp());
}

class HajjTutorialApp extends StatelessWidget {
  const HajjTutorialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gabay sa Hajj at Umrah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TitlesPage(),
    );
  }
}
