import 'package:flutter/material.dart';
import '../providers/font_size_provider.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FontSizeProvider(),
      child: const HajjTutorialApp(),
    ),
  );
}

class HajjTutorialApp extends StatelessWidget {
  const HajjTutorialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hajj Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TitlesPage(),
    );
  }
}
