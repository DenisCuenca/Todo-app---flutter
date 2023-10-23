import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final _mybox = Hive.box("mybox");
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // TODO: implement initState
    if (_mybox.get("TODOLIST") == null) {
      db.createInicialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void change_state(bool? value, int index) {
    setState(() {
      db.todo_list[index][1] = !db.todo_list[index][1];
    });
    db.UpdateData();
  }

  TextEditingController todo_controler = TextEditingController();

  void onSaveTodo() {
    setState(() {
      db.todo_list.add([todo_controler.text, false]);
    });
    Navigator.of(context).pop();
    db.UpdateData();
  }

  void show_dialog() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          todoControler: todo_controler,
          onSave: onSaveTodo,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.todo_list.removeAt(index);
    });
    db.UpdateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text("ToDo App"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.todo_list.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            title: db.todo_list[index][0],
            state: db.todo_list[index][1],
            onChange: (value) => change_state(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: show_dialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
