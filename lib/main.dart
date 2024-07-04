import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:gabay_sa_hajj_umrah/pages/home_page.dart';
import '../providers/font_size_provider.dart';
import 'package:provider/provider.dart';

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
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(), // Initialize BotToast
      navigatorObservers: [BotToastNavigatorObserver()], // Register BotToast observer
      home: const TitlesPage(),
    );
  }
}
