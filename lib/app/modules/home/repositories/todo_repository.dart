import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo/app/modules/home/models/todo_model.dart';
import 'package:firebase_todo/app/modules/home/repositories/todo_repository_interface.dart';

class TodoRepository implements ITodoRepository {
  final Firestore firestore;

  TodoRepository(this.firestore);

  @override
  Stream<List<TodoModel>> getAll() {
    return firestore.collection('todo').snapshots().map((query) {
      return query.documents.map((doc) {
        return TodoModel.fromDocument(doc);
      });
    });
  }
}
