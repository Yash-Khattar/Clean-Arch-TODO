import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Task 1'),
          Row(
            children: [
              Checkbox(value: true, onChanged: (value) {}),
              const SizedBox(width: 10),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
