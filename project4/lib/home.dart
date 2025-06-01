import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_task.dart';
import 'task_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('tasks');
    if (data != null) {
      setState(() {
        tasks = List<Map<String, dynamic>>.from(jsonDecode(data));
      });
    }
  }

  void _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('tasks', jsonEncode(tasks));
  }

  void _addTask(String title, String description) {
    setState(() {
      tasks.add({'title': title, 'description': description, 'done': false});
      _saveTasks();
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
      _saveTasks();
    });
  }

  void _toggleTask(int index) {
    setState(() {
      tasks[index]['done'] = !tasks[index]['done'];
      _saveTasks();
    });
  }

  void _goToAddTaskPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskPage(onAdd: _addTask)),
    );
  }

  void _goToTaskDetails(Map<String, dynamic> task) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskDetailPage(task: task)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My To-Do List')),
      body:
          tasks.isEmpty
              ? const Center(child: Text('No tasks. Add some!'))
              : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return ListTile(
                    leading: Checkbox(
                      value: task['done'],
                      onChanged: (_) => _toggleTask(index),
                    ),
                    title: Text(
                      task['title'],
                      style: TextStyle(
                        decoration:
                            task['done'] ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    subtitle: Text(task['description']),
                    onTap: () => _goToTaskDetails(task),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteTask(index),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToAddTaskPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
