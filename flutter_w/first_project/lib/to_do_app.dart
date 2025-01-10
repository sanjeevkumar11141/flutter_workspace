import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  final nameController = TextEditingController();
  ToDoPriority priority = ToDoPriority.Low;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDoApp'),
        backgroundColor: Colors.pink.shade200,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            addTodo();
          },
          child: Icon(
            Icons.add,
            color: Colors.pink.shade200,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: MyToDo.myTodoList.isEmpty
          ? Center(
        child: Text('Nothings To do!'),
      )
          : ListView.builder(
        itemCount: MyToDo.myTodoList.length,
        itemBuilder: (context, index) {
          final todo = MyToDo.myTodoList[index];
          return TodoItem(
              myToDo: todo,
              onChanged: (value) {
                setState(() {
                  MyToDo.myTodoList[index].complete = value;
                });
              });
        },
      ),
    );
    ;
  }

  void addTodo() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) =>
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: 'Enter Task  Here',
                            border: OutlineInputBorder(),
                            labelText: 'What to do',
                            prefixIcon: Icon(Icons.note_add_sharp)),
                      ),
                      Text(
                        'Select Priority',
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio<ToDoPriority>(
                            value: ToDoPriority.Low,
                            groupValue: priority,
                            onChanged: (value) {
                              setState(() {
                                priority = value!;
                              });
                            },
                          ),
                          Text(ToDoPriority.Low.name),
                          Radio<ToDoPriority>(
                            value: ToDoPriority.Medium,
                            groupValue: priority,
                            onChanged: (value) {
                              setState(() {
                                priority = value!;
                              });
                            },
                          ),
                          Text(ToDoPriority.Medium.name),
                          Radio<ToDoPriority>(
                            value: ToDoPriority.High,
                            groupValue: priority,
                            onChanged: (value) {
                              setState(() {
                                priority = value!;
                              });
                            },
                          ),
                          Text(ToDoPriority.High.name),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: _save, child: Text('Save To Do'))
                    ],
                  ),
                ),
          );
        });
  }

  void _save() {
    if (nameController.text.isEmpty) {
      showAlertDialog(context, 'Input fields not empty');
      return;
    }

    var mytodo = MyToDo(id: DateTime
        .now()
        .microsecond, name: nameController.text, priority: priority);
    MyToDo.myTodoList.add(mytodo);
    setState(() {});
    Navigator.pop(context);
  }

}

void showAlertDialog(BuildContext context, String s) {
  showDialog(context: context, builder: (context) =>
      AlertDialog(
        title: Text('Caution!'),
        content: Text(s),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text('CLOSE!'))
        ],
      ));
}

class TodoItem extends StatelessWidget {
  final MyToDo myToDo;
  final Function(bool) onChanged;

  const TodoItem({super.key, required this.myToDo, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(myToDo.name),
        subtitle: Text(myToDo.priority.name),
        value: myToDo.complete,
        onChanged: (value) {
          onChanged(value!);
        });
  }
}

class MyToDo {
  int id;
  String name;
  ToDoPriority priority;
  bool complete;

  MyToDo({
    required this.id,
    required this.name,
    required this.priority,
    this.complete = false,
  });

  static List<MyToDo> myTodoList = [];
}

enum ToDoPriority { Low, Medium, High }
