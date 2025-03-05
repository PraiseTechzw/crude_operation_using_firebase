import 'package:todo_app/model/todo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference todosCollection =
      FirebaseFirestore.instance.collection('todos');

  // Create
  Future<void> addTodo(Todo todo) async {
    DocumentReference docRef = todosCollection.doc();
    await docRef.set(todo.toMap()..['id'] = docRef.id);
  }

  // Read
  Stream<QuerySnapshot> getTodos() {
    return todosCollection.orderBy('timestamp', descending: true).snapshots();
  }

  // Update
  Future<void> updateTodo(Todo todo) async {
    await todosCollection.doc(todo.id).update(todo.toMap());
  }

  // Delete
  Future<void> deleteTodo(String id) async {
    await todosCollection.doc(id).delete();
  }
}