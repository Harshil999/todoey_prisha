import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todoey_prisha/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(
      taskName: 'abcd',
      isDone: false,
    ),
    Task(
      taskName: 'prro',
      isDone: false,
    ),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskLength {
    return tasks.length;
  }

  void addTask(String newTaskItem) {
    _tasks.add(
      Task(
        taskName: newTaskItem,
        isDone: false,
      ),
    );
    notifyListeners();
  }

  void checkTask(int index, bool isChecked) {
    _tasks[index].isDone = isChecked;
    notifyListeners();
  }

  void deleteTask(int idx) {
    _tasks.remove(_tasks[idx]);
    notifyListeners();
  }
}
