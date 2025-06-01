import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  final Function(String, String) onAdd;

  const AddTaskPage({super.key, required this.onAdd});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void _save() {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();
    if (title.isNotEmpty && description.isNotEmpty) {
      widget.onAdd(title, description);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _save, child: const Text('Save Task')),
          ],
        ),
      ),
    );
  }
}
