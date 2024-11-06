import 'package:shared_preferences/shared_preferences.dart';

class Services {
  final SharedPreferences prefs;
  Services({required this.prefs});

  // show all tasks

  // add task
  Future<void> addTask(String task) async {
    final res = prefs.getStringList("tasks");
    res?.add(task);
    await prefs.setStringList("tasks", res ?? []);
    print(res);
  }

  // delete task

  //edit task
}
