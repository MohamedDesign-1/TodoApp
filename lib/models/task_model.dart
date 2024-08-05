import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  static const String collectionName = 'Tasks List';

  String id;
  String name;
  DateTime date;
  bool isDone;

  TaskModel({
    required this.name,
    required this.date,
    this.id = "",
    this.isDone = false,
  });

  TaskModel.fromFireStore(Map<String, dynamic> data)
      : name = data['task name'],
        date = (data['date'] as Timestamp).toDate(),
        isDone = data['isDone'] ?? false,
        id = data['id'] ?? "";

  Map<String, dynamic> toFireStore() {
    return {
      'task name': name,
      'date': date,
      'isDone': isDone,
      'id': id,
    };
  }
}
