import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/todo.dart';
import '../providers/todo_provider.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  TodoItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(todo.text),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<TodoProvider>(context, listen: false)
                  .removeTodo(todo.id);
            },
          ),
        ],
      ),
      trailing: Checkbox(
        value: todo.completed,
        onChanged: (newValue) {
          Provider.of<TodoProvider>(context, listen: false)
              .toggleTodoStatus(todo.id, newValue ?? false);
        },
      ),
     
    );
  }
}
