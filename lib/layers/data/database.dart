import 'package:hive/hive.dart';

class ToDOdataBase {
  List<dynamic> todoList = [];
  final myBox = Hive.box('MyTaskBox');
  
  // Craete Initail methode for the first time using the app
  createinitialData() {
    todoList = [];
  }
  // load the data from the database
  loadData() {
    todoList = myBox.get(("ToDoList"));
  }
  // ubdatedataBase
  ubdatedataBase() {
        myBox.put("ToDoList",todoList);
  }
}
