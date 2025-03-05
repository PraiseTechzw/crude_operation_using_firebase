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
    return Todo(
      id: snapshot.id,
      title: snapshot['title'],
      description: snapshot['description'],
      isDone: snapshot['isDone'],
      timestamp: snapshot['timestamp'],
    );
  }

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isDone,
    Timestamp? timestamp,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
      'timestamp': timestamp,
    };
  }
}