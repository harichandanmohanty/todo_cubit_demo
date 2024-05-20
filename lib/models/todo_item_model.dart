import 'package:hive/hive.dart';
part 'todo_item_model.g.dart';

@HiveType(typeId: 0)
class TodoItem {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  bool isCompleted = false;

  TodoItem({required this.title, this.description = ""});

  void toggleTodoStatus() {
    isCompleted = !isCompleted;
  }
}

enum DropdownMenuValues {
  all("All"),
  completed("Completed"),
  pending("Pending");

  final String name;
  const DropdownMenuValues( this.name);
}