import 'package:firebase_todo/app/modules/home/models/todo_model.dart';

abstract class ITodoRepository {
  Stream<List<TodoModel>> getAll();

  Future save(TodoModel model);

  Future delete(TodoModel model);
}
