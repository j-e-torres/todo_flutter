class ApiResponse<T> {
  final int status;
  final Map<MODELS, T> data;

  ApiResponse({
    required this.status,
    required this.data,
  });
}

enum MODELS {
  list,
  user,
  task,
  lists,
}
