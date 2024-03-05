import 'package:clean_arch_app/features/domain/entities/task_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel extends TaskEntity {
  TaskModel({required String? id, required String? title, required bool? isDone})
      : super(id: id, title: title, isDone: isDone);

  factory TaskModel.fromSnapshot(DocumentSnapshot snapshot) {
    return TaskModel(
      id: snapshot.get("id"),
      title: snapshot.get("title"),
      isDone: snapshot.get("isDone"),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "id": id,
      "title": title,
      "isDone": isDone,
    };
  }
}
