import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/services/crude_operations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final FirebaseService _firebaseService = FirebaseService();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo App')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddTodoDialog(),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firebaseService.getTodos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              Todo todo = Todo.fromSnapshot(snapshot.data!.docs[index]);
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.description),
                leading: Checkbox(
                  value: todo.isDone,
                  onChanged: (value) {
                    todo.isDone = value!;
                    _firebaseService.updateTodo(todo);
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _firebaseService.deleteTodo(todo.id),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showAddTodoDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Todo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(hintText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text('Add'),
            onPressed: () {
              Todo newTodo = Todo(
                id: '',
                title: _titleController.text,
                description: _descriptionController.text,
                timestamp: Timestamp.now(),
              );
              _firebaseService.addTodo(newTodo);
              _titleController.clear();
              _descriptionController.clear();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}