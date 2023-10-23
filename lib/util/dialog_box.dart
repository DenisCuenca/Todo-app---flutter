import 'package:flutter/material.dart';
import 'package:todo_app/util/material_button.dart';

class DialogBox extends StatelessWidget {
  final todoControler;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.todoControler,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: todoControler,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Escribe tu tudo"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BoxButton(
                  text: "Cancel",
                  action: onCancel,
                ),
                SizedBox(
                  width: 10,
                ),
                BoxButton(
                  text: "Crear",
                  action: onSave,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
