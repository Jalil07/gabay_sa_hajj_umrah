import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:provider/provider.dart';
import '../models/home_page_drawer.dart';
import '../providers/font_size_provider.dart';
import 'content_page.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
    final jsonString =
        await rootBundle.rootBundle.loadString('assets/data.json');
    final jsonResponse = json.decode(jsonString);
    setState(() {
      contents = jsonResponse['hajj_data'];
    });
  }

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
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const HomeDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            expandedHeight: 400.0,
            floating: false,
            pinned: true,
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color(0xff70394B),
              ),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  showBottomSheetSlider(context);
                },
                child: Image.asset(
                  'assets/images/text.png',
                  height: 22,
                  width: 22,
                  color: const Color(0xff70394B),
                ),
              ),
              const SizedBox(width: 15),
            ],
            flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.all(16),
                centerTitle: true,
                background: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
                title: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double top = constraints.biggest.height;
                    return Consumer<FontSizeProvider>(
                      builder: (context, fontSizeProvider, child) {
                        return Text(
                          'Gabay sa Hajj at Umrah',
                          style: TextStyle(
                            color: const Color(0xff70394B),
                            fontFamily: 'Poppins',
                            fontSize: top > 100 ? 14 : 18,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    );
                  },
                ),
                stretchModes: const <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ]),
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
                            style: TextStyle(
                                fontSize: fontSizeProvider.fontSize,
                                fontFamily: 'Poppins'),
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
                      leading: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff70394B)
                        ),
                      ),
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
