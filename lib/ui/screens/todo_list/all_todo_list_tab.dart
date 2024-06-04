import 'package:flutter/material.dart';
import 'package:todo_app/entities/todo.dart';
import 'package:todo_app/ui/widgest/todo_item.dart';

class AllTodoListTab extends StatelessWidget {
  const AllTodoListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (_){},
          child: TodoItem(
              todo: Todo("Name", "description", DateTime.now()),
              onIconButtonPressed: () {}
          ),
        );
      },
    );
  }
}
