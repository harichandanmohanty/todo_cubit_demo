import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_cubit_demo/bloc/cubit/todo_app_cubit.dart';
import 'package:todo_cubit_demo/bloc/state/todo_app_state.dart';
import '../models/todo_item_model.dart';

class FilterDropDown extends StatelessWidget {
  const FilterDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoAppCubit, TodoAppState>(
      builder: (BuildContext context, state) {
        return DropdownButton(
          underline: Container(
            height: 2,
            color: Colors.purpleAccent,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          value: context.read<TodoAppCubit>().filterValue,
          icon: const Icon(Icons.filter_alt_outlined),
          items: DropdownMenuValues.values.map((DropdownMenuValues item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item.name),
            );
          }).toList(),
          onChanged: (DropdownMenuValues? value) {
            context.read<TodoAppCubit>().changeFilterValue(value!);
          },
        );
      },
    );
  }
}