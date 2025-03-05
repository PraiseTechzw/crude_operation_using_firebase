import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/services/crude_operations.dart';

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
      appBar: AppBar(title: Text('Zvinhu Zvekuita')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showTodoDialog(), // Dialog yekuwedzera
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
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Bhatani rekuvandudza (pen icon)
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => _showTodoDialog(existingTodo: todo),
                    ),
                    // Bhatani rekudzima
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _firebaseService.deleteTodo(todo.id),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Unified dialog for both add and edit
  void _showTodoDialog({Todo? existingTodo}) {
    bool isEditing = existingTodo != null;

    // Set controller values if editing
    if (isEditing) {
      _titleController.text = existingTodo.title;
      _descriptionController.text = existingTodo.description;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEditing ? 'Vandudza Chinhu' : 'Wedzera Chinhu Chitsva'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Zita rechinyorwa'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(hintText: 'Tsanangudzo'),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Kanzura'),
            onPressed: () {
              _titleController.clear();
              _descriptionController.clear();
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: Text(isEditing ? 'Vandudza' : 'Wedzera'),
            onPressed: () {
              if (isEditing) {
                // Update existing todo
                Todo updatedTodo = existingTodo.copyWith(
                  title: _titleController.text,
                  description: _descriptionController.text,
                );
                _firebaseService.updateTodo(updatedTodo);
              } else {
                // Create new todo
                Todo newTodo = Todo(
                  id: '',
                  title: _titleController.text,
                  description: _descriptionController.text,
                  timestamp: Timestamp.now(),
                );
                _firebaseService.addTodo(newTodo);
              }
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