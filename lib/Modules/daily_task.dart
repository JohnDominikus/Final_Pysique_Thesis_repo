import 'package:flutter/material.dart';

class DailyTask extends StatefulWidget {
  const DailyTask({super.key});

  @override
  _DailyTaskState createState() => _DailyTaskState();
}

class _DailyTaskState extends State<DailyTask> {
  final List<String> _todos = [];
  final TextEditingController _todoController = TextEditingController();

  void _addTodo() {
    setState(() {
      _todos.add(_todoController.text);
      _todoController.clear();
    });
  }

  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Daily Tasks',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _todoController,
            decoration: const InputDecoration(
              labelText: 'Enter Task',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _addTodo,
            child: const Text('Add Task'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_todos[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeTodo(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
