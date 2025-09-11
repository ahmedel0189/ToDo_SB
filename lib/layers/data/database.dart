import 'package:hive/hive.dart';

class ToDOdataBase {
    List<List<dynamic>> todoList = [];
  final myBox = Hive.openBox('MyTaskBox');
}
