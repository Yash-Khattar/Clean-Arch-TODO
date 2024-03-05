import 'package:clean_arch_app/features/presentation/widgets/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TODO extends StatefulWidget {
  const TODO({super.key});

  @override
  State<TODO> createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
      ),
      body:  Stack(
        children: [
          ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              // Return your chat message widgets here
              return Task();
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                       
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textFieldController,
            
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your task',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        // Implement sending message logic here
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
