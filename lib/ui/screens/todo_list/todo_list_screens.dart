import 'package:flutter/material.dart';
import 'package:todo_app/entities/todo.dart';
import 'package:todo_app/ui/screens/add_new_todo_screen.dart';
import 'package:todo_app/ui/screens/todo_list/all_todo_list_tab.dart';
import 'package:todo_app/ui/screens/todo_list/done_todo_list_tab.dart';
import 'package:todo_app/ui/screens/todo_list/undone_todo_list_tab.dart';


class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> with SingleTickerProviderStateMixin{
  //late TabController _tabController = TabController(length: 3, vsync: this);
  List<Todo> TodoList = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todo List"),
          bottom: _buildTabBar()
        ),
        body: const TabBarView(
         // controller: _tabController,
          children:  [
            AllTodoListTab(),
            UndoneTodoListTab(),
            DoneTodoListTab(),
          ],
        ) ,
        floatingActionButton: _buildTodoFAB(context),
      ),
    );
  }

  FloatingActionButton _buildTodoFAB(BuildContext context) {
    return FloatingActionButton.extended(
        tooltip: "Add new todo",
        label:const Text("Add"),
        icon:const Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewTodo()));
        },
      );
  }

  TabBar _buildTabBar() {
    return const TabBar(
         // controller: _tabController,
          tabs: [
            Tab(text: "All",),
            Tab(text: "Undone",),
            Tab(text: "Done",),
          ],
        );
  }
}
