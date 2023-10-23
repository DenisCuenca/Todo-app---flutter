import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String title;
  final bool state;
  Function(bool?)? onChange;
  Function(BuildContext)? deleteTask;

  ToDoTile(
      {super.key,
      required this.title,
      required this.state,
      required this.onChange,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              backgroundColor: Colors.red.shade300,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(5),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(18.0),
          decoration: BoxDecoration(
              color: Colors.blueGrey[400],
              borderRadius: BorderRadius.circular(4)),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Checkbox(
                value: state,
                onChanged: onChange,
                // activeColor: ,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                  decoration:
                      state ? TextDecoration.lineThrough : TextDecoration.none,
                  color: Colors.white),
            ),
          ]),
        ),
      ),
    );
  }
}
