import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AttributionPage extends StatefulWidget {
  const AttributionPage({super.key});

  @override
  State<AttributionPage> createState() => _AttributionPageState();
}

class _AttributionPageState extends State<AttributionPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xff70394B)),
        title: const Text(
          'Attribution',
          style: TextStyle(color: Color(0xff70394B)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Partners',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                const SizedBox(height: 18),
                Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0, .6, 1],
                        colors: [
                          Color(0xff70394B),
                          Color(0xffa2667a),
                          Color(0xff70394B),
                        ],
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/dialoguetime.png',
                          height: 75,
                        ),
                        const Spacer(),
                        const Text(
                          'جمعية وقت الحوار\nللدعوة الإلكترونية',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontFamily: 'Uthmanic'),
                        ),
                      ],
                    )),
                Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0, .6, 1],
                      colors: [
                        Color(0xff70394B),
                        Color(0xffa2667a),
                        Color(0xff70394B),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            'Supports',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 23, top: 6),
                        child: Text(
                          'All the People who supports the app',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Poppins'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 55),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildRow(String label, double fontSize, String fontFamily,
      String imagePath, bool link) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        imagePath != 'null'
            ? const SizedBox(height: 18)
            : const SizedBox(height: 10),
        imagePath != 'null'
            ? Transform.translate(
                offset: const Offset(19, 0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: Image.asset(
                    imagePath,
                    height: 95,
                    width: 95,
                  ),
                ),
              )
            : Container(),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 7),
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.normal,
                  fontFamily: fontFamily,
                  color: Colors.white),
              softWrap: true,
            ),
            const SizedBox(width: 8),
            link
                ? IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () async {
                      if (await canLaunchUrl(_youtubeLink)) {
                        await _launchLink();
                      } else {
                        throw 'Could not launch URL';
                      }
                    },
                    icon: const Icon(
                      Icons.open_in_browser,
                      color: Colors.blue,
                    ))
                : Container(),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

final Uri _youtubeLink =
    Uri.parse('https://www.youtube.com/channel/UCUVh6s5TbNCQDE_QlxOaWJg');
Future<void> _launchLink() async {
  if (!await launchUrl(_youtubeLink, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $_youtubeLink');
  }
}
