import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable{
  final String? id;
  final String? title;
  final bool? isDone;

  TaskEntity({this.id, this.title, this.isDone});

  @override
  List get props => [title, isDone, id];
}