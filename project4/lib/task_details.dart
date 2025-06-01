import 'package:flutter/material.dart';

class TaskDetailPage extends StatelessWidget {
  final Map<String, dynamic> task;

  const TaskDetailPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(task['title'])),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(task['description'], style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
