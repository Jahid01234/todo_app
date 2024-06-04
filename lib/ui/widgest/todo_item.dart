import 'package:flutter/material.dart';
import 'package:todo_app/entities/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onIconButtonPressed;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onIconButtonPressed
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: _getCardTintColor(todo.isDone),
      color: _getCardBGColor(todo.isDone),
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ListTile(
          title: Text(
            todo.title,
            style: TextStyle(
                decoration: _getTextDecoration(todo.isDone),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(todo.description),
              Text(todo.time.toString()),
            ],
          ),
          trailing: _buildRoundedIconButton(todo.isDone)),
    );
  }

  Widget _buildRoundedIconButton(bool isDone) {
    return GestureDetector(
      onTap: onIconButtonPressed,
      child: CircleAvatar(
        child: Icon(
          _getIcon(true),
        ),
      ),
    );
  }

  IconData _getIcon(bool isDone) {
    return isDone ? Icons.check : Icons.clear;
  }

  TextDecoration? _getTextDecoration(bool isDone) {
    return isDone ? TextDecoration.lineThrough : null;
  }

  Color? _getCardTintColor(bool isDone) {
    return isDone ? Colors.greenAccent : null;
  }

  Color? _getCardBGColor(bool isDone) {
    return isDone ? Colors.green : null;
  }
}
