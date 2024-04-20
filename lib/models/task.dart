class Task {
  late final String taskName;
  late bool isDone;

  Task({
    required this.taskName,
    required this.isDone,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}
