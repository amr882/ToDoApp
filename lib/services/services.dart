import 'package:shared_preferences/shared_preferences.dart';

class TaskServices {
  final SharedPreferences prefs;
  TaskServices({required this.prefs});

  // show all tasks
  Future<List<String>> getTasks() async {
    return prefs.getStringList("tasks") ?? [];
  }

  // add task
  Future<void> addTask(String task) async {
    final res = prefs.getStringList("tasks");
    res?.add(task);
    await prefs.setStringList("tasks", res ?? []);
    print(res);
  }

  // delete task
  Future<void> deleteTask(int index) async {
    final res = prefs.getStringList("tasks");
    res?.removeAt(index);
    await prefs.setStringList("tasks", res ?? []);
  }
}
