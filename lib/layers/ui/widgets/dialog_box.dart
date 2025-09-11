import 'package:flutter/material.dart';
import 'package:todo_sb/layers/ui/widgets/entry_buttom.dart';

class DialogBox extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final TextEditingController controller;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });
  addTaskButtom() {}
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      content: SizedBox(
        height: 150,
        width: 350,
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Enter task...",
                  hintStyle: TextStyle(),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  EntryButtom(
                    entryButtomtext: 'Save',
                    onPressed: onSave,
                  ),
                  EntryButtom(
                    entryButtomtext: 'Cancel',
                    onPressed: onCancel,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
