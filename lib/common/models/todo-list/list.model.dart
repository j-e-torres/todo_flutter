import 'package:todo_flutter/common/models/user/user.model.dart';

import '../task/task.model.dart';

class TodoList {
  final String id;
  final String listname;
  final User listOwner;
  final String listNotes;
  final List<Task> tasks;

  TodoList({
    required this.id,
    required this.listNotes,
    required this.listOwner,
    required this.listname,
    required this.tasks,
  });
}
