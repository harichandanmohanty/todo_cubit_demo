import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_cubit_demo/models/todo_item_model.dart';

import '../bloc/cubit/todo_app_cubit.dart';


class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final textTitleController = TextEditingController();
  final textDescController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textTitleController.dispose();
    textDescController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const screenTitle = "Create New Todo";
    const textStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text(screenTitle)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Title", style: textStyle),
            TextField(
              autofocus: true,
              controller: textTitleController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter a new todo',
              ),
            ),
            const SizedBox(height: 20),
            const Text("Description", style: textStyle),
            TextField(
              controller: textDescController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Description',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (textTitleController.text.isNotEmpty) {
            final todoItem = TodoItem(title: textTitleController.text, description: textDescController.text);
            context.read<TodoAppCubit>().createNewTodo(todoItem);
            Navigator.of(context).pop();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Center(child: Text("Title cannot be empty !", style: textStyle,)))
            );
          }
        },
        tooltip: 'Create new todo',
        child: const Text("ADD", style: textStyle,),
      ),
    );
  }
}
