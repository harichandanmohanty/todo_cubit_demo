
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo_cubit_demo/bloc/state/todo_app_state.dart';
import 'package:todo_cubit_demo/models/todo_item_model.dart';

class TodoAppCubit extends Cubit<TodoAppState> {
  dynamic box;
  TodoAppCubit(): super(const TodoAppInitialState());

  List<TodoItem> todoList = [];
  DropdownMenuValues filterValue = DropdownMenuValues.all;

  openDbAndReadTodoList() async {
    await Hive.openBox<TodoItem>('todoList');
    box = Hive.box<TodoItem>('todoList');
    todoList = box.values.toList().cast<TodoItem>();
  }

  void changeFilterValue(DropdownMenuValues value) {
    filterValue = value;
    emit(TodoAppChangeFilterValueState());
  }

  void toggleTodoStatus(TodoItem todoObj, int index) {
    todoObj.toggleTodoStatus();
    editTodoItem(todoObj, index);
    emit(TodoAppToggleTodoStatusState());
  }

  Future<void> createNewTodo(TodoItem todoItem) async {
    await box.add(todoItem);
    todoList = Hive.box<TodoItem>('todoList').values.toList().cast<TodoItem>();
    print("My todo : $todoList");
    emit(TodoAppCreateNewTodoState());
  }

  Future<void> deleteTodoItem(TodoItem todoItem, int index) async {
    await box.deleteAt(index);
    todoList = Hive.box<TodoItem>('todoList').values.toList().cast<TodoItem>();
    emit(TodoAppDeleteTodoItemState());
  }

  Future<void> editTodoItem(TodoItem todoItem, int index) async {
    await box.putAt(index, todoItem);
    todoList = Hive.box<TodoItem>('todoList').values.toList().cast<TodoItem>();
    emit(TodoAppEditTodoItemState());
  }

}