import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContentPage extends StatefulWidget {
  final String title;
  final String content;

  ContentPage({required this.title, required this.content});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.copy),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: '${widget.title}\n\n${widget.content}'));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Copied to clipboard')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SelectableText(widget.content, style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
