import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_sb/layers/ui/screens/home_page_scr.dart';

class SandBoxToDo extends StatelessWidget {
  const SandBoxToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SandBox ToDo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch:
            Colors.blue, // اللون الأساسي
        scaffoldBackgroundColor:
            Colors.blue[200], // خلفية الشاشات
        appBarTheme: const AppBarTheme(
          backgroundColor:
              Colors.blue, // لون الـ AppBar
          foregroundColor: Colors.white,
          scrolledUnderElevation: 50,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      home: HomePageScreen(),
    );
  }
}

void main() async {
  // init hive
  await Hive.initFlutter();
  // open the box
  var box = await Hive.openBox('MyTaskBox');
  runApp(const SandBoxToDo());
}
