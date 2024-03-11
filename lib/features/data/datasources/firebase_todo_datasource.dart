import 'package:clean_arch_app/features/domain/entities/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTodoDataSource {
  final CollectionReference _todosCollection =
      FirebaseFirestore.instance.collection('todos');

  Future<List<Todo>> getTodos() async {
    final querySnapshot = await _todosCollection.get();
    return querySnapshot.docs
        .map((doc) => Todo.fromDocumentSnapshot(doc))
        .toList();
  }

  Future<void> addTodo(Todo todo) async {
    await _todosCollection.add(todo.toMap());
  }

  Future<void> deleteTodo(String todoId) async {
    await _todosCollection.doc(todoId).delete();
  }

  Future<void> updateTodoStatus(String todoId, bool isCompleted) async {
    await _todosCollection.doc(todoId).update({'completed': isCompleted});
  }
}
