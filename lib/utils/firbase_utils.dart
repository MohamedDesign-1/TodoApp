import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/models/task_model.dart';

class FirebaseUtils {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks List')
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel(
          name: snapshot.data()!['task name'],
          date: snapshot.data()!['date'],
          isDone: snapshot.data()!['isDone'] ?? false,
          id: snapshot.data()!['id'] ?? "",
        );
      },
      toFirestore: (taskModel, _) {
        return taskModel.toJson();
      },
    );
  }


}
