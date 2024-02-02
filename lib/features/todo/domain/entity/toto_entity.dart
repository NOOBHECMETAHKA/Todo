class TodoEntity {
  final String name;
  final String description;
  bool isCheck;

  TodoEntity({required this.name, required this.description, this.isCheck = false});
}
