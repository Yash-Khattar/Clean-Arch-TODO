import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todo_provider.dart';

class AddTodoScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Enter todo...',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print(1);
                    final text = _textController.text.trim();
                    if (text.isNotEmpty) {
                      print(2);
                     provider
                          .addNewTodo(text);
                          print(3);
                      Navigator.pop(context);
                      print(4);
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
