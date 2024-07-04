import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontSizeProvider with ChangeNotifier {

  double _fontSize = 13.0;  // Default Translation font size

  FontSizeProvider() {
    _loadFontSizes();
  }

  double get fontSize => _fontSize;

  void _loadFontSizes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _fontSize = prefs.getDouble('fontSize') ?? 13.0;
    notifyListeners();
  }

  void updateTranslationFontSize(double newFontSize) async {
    _fontSize = newFontSize;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('fontSize', _fontSize);
    notifyListeners();
  }
}

