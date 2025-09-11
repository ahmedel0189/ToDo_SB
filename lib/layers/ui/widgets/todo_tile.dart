import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TodoTile extends StatelessWidget {
  final String taskName;
  final bool checkBoxValue;
  final Function(bool?)? onChanged;
  final Function(BuildContext?)? deleteFunction;
  const TodoTile({
    super.key,
    required this.taskName,
    required this.checkBoxValue,
    this.onChanged, required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 16,
        top: 16,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed:deleteFunction!,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          child: Row(
            children: [
              Checkbox(
                value: checkBoxValue,
                onChanged: onChanged,
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: checkBoxValue
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
