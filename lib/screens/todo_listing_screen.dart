import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_demo/bloc/cubit/todo_app_cubit.dart';
import 'package:todo_cubit_demo/bloc/state/todo_app_state.dart';
import 'package:todo_cubit_demo/models/todo_item_model.dart';
import 'package:todo_cubit_demo/widgets/todo_item_widget.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key,});


  bool visibilityCheck(TodoItem item, DropdownMenuValues filterValue) {
    switch (filterValue) {
      case DropdownMenuValues.pending:
        return !item.isCompleted;
      case DropdownMenuValues.completed:
        return item.isCompleted;
      case DropdownMenuValues.all:
      default:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<TodoAppCubit, TodoAppState>(
        builder: (BuildContext context, state) {
          var index = 0;
          return ListView(
            children: context.read<TodoAppCubit>().todoList.map((_) => buildTodoItemVisibility(context, index++, context.read<TodoAppCubit>())).toList(),
          );
        },
      ),
    );
  }

  Visibility buildTodoItemVisibility(BuildContext context, int index , TodoAppCubit todoAppCubit) {
    final todoObj = todoAppCubit.todoList[index];
    final filterValue = todoAppCubit.filterValue;
    return Visibility(
      visible: visibilityCheck(todoObj, filterValue),
      child: TodoItemWidget(
        index: index,
      ),
    );
  }
}
