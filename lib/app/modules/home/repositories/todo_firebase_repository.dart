import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo/app/modules/home/models/todo_model.dart';
import 'package:firebase_todo/app/modules/home/repositories/todo_repository_interface.dart';

class TodoFirebaseRepository implements ITodoRepository {
  final Firestore firestore;

  TodoFirebaseRepository(this.firestore);

  @override
  Stream<List<TodoModel>> getAll() {
    return firestore
        .collection('todo')
        .orderBy('position')
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return TodoModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future delete(TodoModel model) async {
    return model.reference.delete();
  }

  @override
  Future save(TodoModel model) async {
    if (model.reference == null) {
      int total = (await Firestore.instance.collection('todo').getDocuments())
          .documents
          .length;
      model.reference = await Firestore.instance
          .collection('todo')
          .add({'title': model.title, "check": model.check, 'position': total});
    } else {
      model.reference.updateData({'title': model.title, "check": model.check});
    }
  }
}
