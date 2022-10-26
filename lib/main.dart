// ignore_for_file: sort_child_properties_last, prefer_const_constructors, non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_notes/widgets/Counter.dart';
import 'package:flutter_notes/widgets/TodoCord.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Notes(),
    );
  }
}

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

// عملت كل المتغيرات في الكلاس اللي اسمه تاسك
class Task {
  late String title;
  late bool status;

  Task({required this.title, required this.status});
}

// ignore: non_constant_identifier_names

class _NotesState extends State<Notes> {
  final myController = TextEditingController();

  // ignore: non_constant_identifier_names
  //list for all tasks
  List Alltasks = [
    Task(title: "watch Tv", status: true),
    Task(title: "study flutter", status: true),
    Task(title: "do my work", status: true),
  ];
// ignore: non_constant_identifier_names
//add task in my list
  ADDTask() {
    setState(() {
      Alltasks.add(
        Task(title: myController.text, status: false),
      );
    });
  }

// count of the completed task for loop not for each
  int CounterCopletedTask() {
    var counter = 0;
    for (var item in Alltasks) {
      if (item.status) {
        counter++;
      }
    }
    return counter;
  }

// delete index task
  delete(int click) {
    setState(() {
      Alltasks.remove(Alltasks[click]);
    });
  }

// delete all tasks in my list 
  DeleteAll() {
    setState(() {
      Alltasks.removeRange(Alltasks[0], Alltasks.length);
    });
  }
//change status in my list from check in x 
  Changestatus(int taskindex) {
    setState(() {
      Alltasks[taskindex].status = !Alltasks[taskindex].status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.delete_forever),
              iconSize: 27,
              onPressed: () {
                DeleteAll();
              },
            )
          ],
          backgroundColor: const Color.fromARGB(51, 122, 210, 210),
          title: const Text(
            "Notes",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          )),
      body: SizedBox(
        width: double.infinity,
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Counter(
            alltask: Alltasks.length,
            Counttask: CounterCopletedTask(),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: Alltasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Todocard(
                    countindex: index,
                    delete: delete,
                    Changestatus: Changestatus,
                    vartitle: Alltasks[index].title,
                    doneOrnot: Alltasks[index].status,
                  );
                }),
          )
        ]),
      ),
      //add new list throw floating action buttom
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    height: 200,
                    child: Column(
                        //  mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: myController,
                            maxLength: 28,
                            decoration: InputDecoration(
                                labelText: " Add New Task",
                                fillColor: Colors.blueAccent),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          TextButton(
                            onPressed: () {
                              ADDTask();
                              Navigator.pop(context);
                            },
                            child: Text("ADD", style: TextStyle(fontSize: 22)),
                          )
                        ]),
                  ),
                );
              })
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
