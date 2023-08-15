class User {
  final String id;
  final Role role;
  final String username;
  final String displayName;
  // final List<TodoList> lists;

  User({
    required this.id,
    required this.role,
    required this.username,
    required this.displayName,
    // required this.lists,
  });
}

enum Role {
  user,
  admin,
}
