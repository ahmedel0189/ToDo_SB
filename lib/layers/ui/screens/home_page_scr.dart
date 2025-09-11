import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_sb/layers/data/database.dart';
import 'package:todo_sb/layers/ui/widgets/dialog_box.dart';
import 'package:todo_sb/layers/ui/widgets/todo_tile.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() =>
      _HomePageScreenState();
}

class _HomePageScreenState
    extends State<HomePageScreen> {
  @override
  void initState() {
    if (myBox.get(("ToDoList"))== null) {
      db.createinitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final myBox = Hive.box('MyTaskBox');
  final controller = TextEditingController();
  ToDOdataBase db = ToDOdataBase();
  // List<List<dynamic>> todoList = [];

  checkBoxChanger(int index) {
    setState(() {
      db.todoList[index][1] =
          !db.todoList[index][1];
    });
    db.ubdatedataBase();
  }

  addnewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: controller,
          onSave: saveNewTask,
          onCancel: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  saveNewTask() {
    setState(() {
      db.todoList.add([controller.text, false]);
    });
    controller.clear();
    Navigator.pop(context);
    db.ubdatedataBase();
  }

  deleteTask(index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.ubdatedataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ToDo SB',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: db.todoList[index][0],
              checkBoxValue:
                  db.todoList[index][1],
              onChanged: (value) {
                checkBoxChanger(index);
              },
              deleteFunction: (context) {
                deleteTask(index);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addnewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
