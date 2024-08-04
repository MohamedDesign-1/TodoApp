class TaskModel {
  String id;
  String name;
  String date;
  bool isDone;

  TaskModel({
    required this.name,
    required this.date,
    this.id = "",
    this.isDone = false,
  });

  TaskModel fromJson(Map<String, dynamic> json) {
    return TaskModel(
      name: json['task name'],
      date: json['date'],
      isDone: json['isDone'] ?? false,
      id: json['id'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task name': name,
      'date': date,
      'isDone': isDone,
      'id': id,
    };
  }
}
