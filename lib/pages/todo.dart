import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  final String taskName;
  final String taskName2;

  VoidCallback onDismissed;
  //final String taskSubtitle;
  ToDo(
      {super.key,
      this.taskName2 = '',
      required this.taskName,
      required this.onDismissed}); // required this.taskSubtitle

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  bool taskCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      resizeDuration: const Duration(milliseconds: 200),
      key: ObjectKey(widget),
      onDismissed: (direction) {
        widget.onDismissed();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          child: Material(
            borderRadius: BorderRadius.circular(50),
            elevation: 5,
            child: ListTile(
              onTap: () {},
              title: Text(widget.taskName,
                  style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
              subtitle: Text(widget.taskName2,
                  style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
              trailing: Transform.scale(
                scale: 1.5,
                child: Checkbox(
                    shape: const CircleBorder(),
                    value: taskCompleted,
                    onChanged: (newbool) {
                      setState(() {
                        taskCompleted = newbool ?? false;
                      });
                    },
                    checkColor: Colors.white,
                    activeColor: Colors.greenAccent),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
