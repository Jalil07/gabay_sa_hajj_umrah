import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/attribution_page.dart';
import 'dart:io';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {

  void showDonateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF007CFF),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      // Adjust the curve radius here
                      child: Image.asset('assets/images/qr_cropped.jpg'),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/images/GCash.png', height: 40, width: 40,),
                        ),
                        const SizedBox(width: 25),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText('JOENARDSON D.', style: TextStyle(
                              fontSize: 14, color: Color(0xFF007CFF),),),
                            SelectableText('09060092160', style: TextStyle(
                              fontSize: 15, color: Color(0xFF007CFF),),),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const SelectableText('For other methods, contact the developer.',
                style: TextStyle(fontSize: 15, color: Colors.white),),
              // Display the text
              const SizedBox(height: 20),
              // Add space before the close button
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text('Close', style: TextStyle(fontSize: 15,
                        color: Colors.white),), // Text of the close button
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      String subject = 'Sadaqah Inquiry via Gabay sa Hajj at Umrah';
                      String body = '';
                      _launchGmail(subject, body);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Contact Developer', style: TextStyle(
                        fontSize: 15,
                        color: Colors.white),), // Text of the close button
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
                child: ListView(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        // Adjust the curve radius here
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 95,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Gabay sa Hajj at Umrah',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Divider(thickness: 0.7),
                  const SizedBox(height: 15),
                  const Text(
                    'Settings',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'General',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) =>
                            AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              title: Row(
                                children: [
                                  const Text('About Developer'),
                                  const Spacer(),
                                  IconButton(
                                    splashRadius: 25,
                                    // The close icon that dismisses the dialog
                                    icon: const Icon(Icons.close),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                              content: SingleChildScrollView(
                                child: myInfo(),
                              ),
                            ),
                      );
                    },
                    title: const Text(
                      'About Developer',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    leading: const Icon(
                      Icons.developer_mode,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      showDonateDialog(context);
                    },
                    title: const Text(
                      'Support',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    leading: Image.asset(
                      'assets/images/gcash_black.png',
                      height: 20,
                      color: Colors.grey[800],
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      Uri urlToLaunch = Platform.isIOS
                          ? _appleAppUrl
                          : _androidAppUrl;

                      if (await canLaunchUrl(urlToLaunch)) {
                        await _launchURL(urlToLaunch);
                      } else {
                        throw 'Could not launch URL';
                      }
                    },
                    title: const Text(
                      'More App',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    leading: const Icon(
                      Icons.store,
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AttributionPage()),
                      );
                    },
                    title: const Text(
                      'Attribution',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    leading: const Icon(
                      Icons.attribution,
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      _launchPolicy();
                    },
                    title: const Text(
                      'Privacy Policy',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    leading: const Icon(
                      Icons.privacy_tip,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Contacts',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  ListTile(
                    onTap: () {
                      _launchMessenger();
                    },
                    title: const Text(
                      'Messenger',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    leading: const Icon(
                      Icons.messenger_outline,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      String subject =
                          'Gabay sa Hajj at Umrah: Contact developer';
                      String body = '';
                      _launchGmail(subject, body);
                    },
                    title: const Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    leading: const Icon(
                      Icons.email_outlined,
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/jsd.png',
                    height: 45,
                  ),
                  const SizedBox(width: 15),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Developed by',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      Text(
                        'JSD Applications',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final Uri _appleAppUrl = Uri.parse(
      'https://apps.apple.com/us/developer/joenardson-divino/id1682679666');
  final Uri _androidAppUrl = Uri.parse(
      'https://play.google.com/store/apps/dev?id=6989504765451629993&hl=en&gl=US');

  Future<void> _launchURL(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  //open privacy policy
  final Uri _policy = Uri.parse(
      'https://jsdapplications.blogspot.com/2024/02/gabay-sa-hajj-at-umrah-privacy-policy.html');

  Future<void> _launchPolicy() async {
    if (!await launchUrl(_policy, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch Messenger');
    }
  }

  //open messenger
  final Uri _messenger = Uri.parse('fb-messenger://user/100822268042440');
  Future<void> _launchMessenger() async {
    if (!await launchUrl(_messenger, mode: LaunchMode.externalApplication)) {
      BotToast.showText(text: 'Messenger not available');
    }
  }

  //open gmail
  Future<void> _launchGmail(String subject, String body) async {
    final Uri gmail = Uri.parse(
        'mailto:jsd.application@gmail.com?subject=$subject&body=$body');
    if (!await launchUrl(gmail, mode: LaunchMode.externalApplication)) {
      BotToast.showText(text: 'Mail not available');
    }
  }

  SingleChildScrollView myInfo() =>
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jalil Satur Divino (JSD)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Da’iyah and Mobile App Developer.'),
            const SizedBox(height: 10),
            const Text(
                'Has over 7 years of experience in online Da’wah and counting.'),
            const SizedBox(height: 20),
            const Text(
              'Educational Background:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
                '- Ma\'had Al-Ma\'arif Ash-Shar\'iy Baguio City S.Y. 2011-2013'),
            const Text('- Current Student at AMA University'),
            const SizedBox(height: 20),
            const Text(
              'Aqeedah:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('- Ahlus Sunnah wal-Jama\'ah As-Salafiyyah'),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                showDonateDialog(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  // Define the border of the Container
                  border: Border.all(
                    color: Colors.grey, // Color of the border
                    width: 2.0, // Width of the border
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Support Us',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    SizedBox(width: 10),
                    Icon(Icons.play_arrow_sharp)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
}