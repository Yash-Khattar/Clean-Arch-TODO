import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String id;
  final String text;
  final bool completed;

  Todo({
    required this.id,
    required this.text,
    required this.completed,
  });

  factory Todo.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Todo(
      id: doc.id,
      text: data['text'],
      completed: data['completed'] ?? false,
    );
  }
// do it in usecases
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'completed': completed,
    };
  }
}
