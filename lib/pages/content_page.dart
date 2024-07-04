import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/font_size_provider.dart';

class ContentPage extends StatefulWidget {
  final String title;
  final String content;

  const ContentPage({super.key, required this.title, required this.content});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {

  void showBottomSheetSlider(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Consumer<FontSizeProvider>(
          builder: (context, fontSizeProvider, child) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Adjust Font Size'),
                  SliderTheme(
                    data: const SliderThemeData(
                      trackShape: RoundedRectSliderTrackShape(),
                    ),
                    child: Slider(
                      activeColor: const Color(0xff70394B),
                      inactiveColor: Colors.grey,
                      value: fontSizeProvider.fontSize,
                      min: 10.0,
                      max: 50.0,
                      onChanged: (newFontSize) {
                        fontSizeProvider.updateTranslationFontSize(newFontSize);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {
              showBottomSheetSlider(context);
            },
            child: Image.asset(
              'assets/images/copy.png',
              height: 24,
              width: 24,
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              Clipboard.setData(
                ClipboardData(text: '${widget.title}\n\n${widget.content}'),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Copied to clipboard')),
              );
            },
            child: Image.asset(
              'assets/images/text.png',
              height: 21,
              width: 21,
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<FontSizeProvider>(
                builder: (context, fontSizeProvider, child) {
                  return Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: fontSizeProvider.fontSize,
                      fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              Consumer<FontSizeProvider>(
                builder: (context, fontSizeProvider, child) {
                  return SelectableText(
                    widget.content,
                    style: TextStyle(fontSize: fontSizeProvider.fontSize, fontFamily: 'Poppins',),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
