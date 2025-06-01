import 'package:flutter/material.dart';
import 'add_note_page.dart';
import 'note_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> notes = [];

  void _addNote(String title, String content) {
    setState(() {
      notes.add({'title': title, 'content': content});
    });
  }

  void _deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  void _goToAddNotePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNotePage(onSave: _addNote)),
    );
  }

  void _openNoteDetails(Map<String, String> note) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteDetailsPage(note: note)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Notes')),
      body:
          notes.isEmpty
              ? const Center(child: Text("No notes yet. Add one!"))
              : ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(notes[index]['title']!),
                    subtitle: Text(
                      notes[index]['content']!.length > 30
                          ? '${notes[index]['content']!.substring(0, 30)}...'
                          : notes[index]['content']!,
                    ),
                    onTap: () => _openNoteDetails(notes[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteNote(index),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToAddNotePage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
