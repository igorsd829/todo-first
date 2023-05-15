import 'package:alex/pages/todo.dart';
import 'package:flutter/material.dart';
import 'alert_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controllerTitle = TextEditingController();
  final _controllersubtitle = TextEditingController();

  //List taskList = [];
  //List taskList2 = [];
  List<Tarefas> taskTarefas = [];

  addTask() {
    setState(() {
      taskTarefas.add(Tarefas(
          title: _controllerTitle.text, subtitle: _controllersubtitle.text));
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controllerTitle,
            controller2: _controllersubtitle,
            save: () {
              if (_controllerTitle.text.isNotEmpty) {
                addTask();
                setState(() {
                  _controllerTitle.clear();
                  _controllersubtitle.clear();
                  Navigator.of(context).pop();
                });
              }
            },
            cancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        leading: Icon(
          Icons.dashboard_outlined,
          size: 40,
          color: Colors.blue[300],
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'All Tasks',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: taskTarefas.length,
          itemBuilder: ((context, index) {
            return ToDo(
                taskName: taskTarefas[index].title,
                taskName2: taskTarefas[index].subtitle ?? '',
                onDismissed: () {
                  setState(() {
                    taskTarefas.removeAt(index);
                  });
                });
          }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(100, 181, 246, 1),
          onPressed: () {
            createNewTask(); //addTask();
          },
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class Tarefas {
  String title;
  String? subtitle;
  Tarefas({
    required this.title,
    this.subtitle,
  });
}

class To extends StatelessWidget {
  final String nome;
  const To({super.key, required this.nome});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nome),
    );
  }
}
