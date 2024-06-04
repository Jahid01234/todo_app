import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/todo_list/todo_list_screens.dart';


class AddNewTodo extends StatefulWidget {
  const AddNewTodo({super.key});

  @override
  State<AddNewTodo> createState() => _AddNewTodoState();
}

class _AddNewTodoState extends State<AddNewTodo> {

  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Todo"),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key:_formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return "Enter the title";
                    }
                    return null;
                  },
                  controller: _titleTEController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    hintText: "Title",
                    labelText: "Title",
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _descriptionTEController,
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return "Enter the description";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                  ),
                  maxLength: 200,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TodoListScreen()));
                    }
                  },
                  child: const Text("Add"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
