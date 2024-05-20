import 'package:equatable/equatable.dart';

class TodoAppState {
  const TodoAppState();
}

class TodoAppInitialState extends TodoAppState {
  const TodoAppInitialState();
}

class TodoAppOpenAndReadDbState extends TodoAppState{
  const TodoAppOpenAndReadDbState();

}

class TodoAppChangeFilterValueState extends TodoAppState {
  const TodoAppChangeFilterValueState();

}

class TodoAppToggleTodoStatusState extends TodoAppState {
  const TodoAppToggleTodoStatusState();

}

class TodoAppCreateNewTodoState extends TodoAppState {
  const TodoAppCreateNewTodoState();
}

class TodoAppDeleteTodoItemState extends TodoAppState {
  const TodoAppDeleteTodoItemState();

}

class TodoAppEditTodoItemState extends TodoAppState {
  const TodoAppEditTodoItemState();

}