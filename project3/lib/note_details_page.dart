import 'package:flutter/material.dart';

class NoteDetailsPage extends StatelessWidget {
  final Map<String, String> note;

  const NoteDetailsPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(note['title']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(note['content']!, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
