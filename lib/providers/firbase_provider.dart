import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/task_model.dart';
import '../utils/firbase_utils.dart';

class FireBaseProvider extends ChangeNotifier{

  List<Task> tasksList = [];
  var selectDate = DateTime.now();
  void getAllTasksFromFireStore() async {
    QuerySnapshot<Task> querySnapshot = await FirebaseUtils.getTasksCollection().get();
    tasksList = querySnapshot.docs.map((doc){
      return doc.data();
    }).toList();

    tasksList = tasksList.where((task) {
      if (selectDate.day == task.dateTime.day && selectDate.month == task.dateTime.month && selectDate.year == task.dateTime.year) {
        return true;
      }
      return false;
    },).toList();

    tasksList.sort((Task task1 , Task task2){
      return task1.dateTime.compareTo(task2.dateTime);
    });

    notifyListeners();
  }

  void changeSelectDate(DateTime newSelectDate) {
    selectDate = newSelectDate;
    getAllTasksFromFireStore();
    notifyListeners();
  }

  void removeTask(Task task) {
    tasksList.remove(task);
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    await FirebaseUtils.deleteTaskFromFireStore(task);
    removeTask(task);
  }

  void updateTask(Task task) {
    FirebaseUtils.updateTaskInFireStore(task);
    getAllTasksFromFireStore();
    notifyListeners();
  }

  void taskToDone(Task task) {
    task.isDone = true;
    FirebaseUtils.updateTaskInFireStore(task);
    getAllTasksFromFireStore();
    notifyListeners();
  }
}
