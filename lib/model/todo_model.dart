import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String id;
  String title;
  String description;
  bool isDone;
  Timestamp timestamp;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
    required this.timestamp,
  });

  factory Todo.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Todo(
      id: snapshot.id,
      title: data['title'],
      description: data['description'],
      isDone: data['isDone'],
      timestamp: data['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isDone': isDone,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }
}