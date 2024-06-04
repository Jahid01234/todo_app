import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/todo_list/todo_list_screens.dart';


class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      home: TodoListScreen(),
      theme: _lightThemeData()
    );
  }

  ThemeData _lightThemeData() {
    return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
    );
  }
}
