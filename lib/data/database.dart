import 'package:hive/hive.dart';

class ToDoDatabase {
  List todo_list = [];

  final _mybox = Hive.box("mybox");

  void createInicialData() {
    todo_list = [
      ["make totu", false],
      ["make totu", true],
    ];
  }

  void loadData() {
    todo_list = _mybox.get("TODOLIST");
  }

  void UpdateData() {
    _mybox.put("TODOLIST", todo_list);
  }
}
