// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unnecessary_import

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todocard extends StatelessWidget {
  final String vartitle;
  final bool doneOrnot;
  final Function Changestatus;
  final int countindex;
  final Function delete;
  const Todocard(
      {super.key,
      required this.delete,
      required this.vartitle,
      required this.doneOrnot,
      required this.countindex,
      required this.Changestatus});
  @override
  Widget build(BuildContext context) {
    // بغير الحالة بتاعتي عن طريق index
    return GestureDetector(
      onTap: () {
        Changestatus(countindex);
      },
      // design in my sheet 90% about application
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.all(15),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  vartitle,
                  style: TextStyle(color:doneOrnot?Colors.black: Colors.white,
                  decoration: doneOrnot ?TextDecoration.lineThrough:TextDecoration.none, 
                  fontSize: 20),
                ),
                Row(
                  children: [
                    Icon(
                      doneOrnot ? Icons.check : Icons.close_sharp,
                      color: doneOrnot ? Colors.green : Colors.red,
                     
                      size: 27,
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      iconSize: 27,
                      color: Colors.white,
                      onPressed: () {
                        delete(countindex);
                      },
                    )
                  ],
                )
              ]),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color.fromARGB(88, 23, 200, 200),
          ),
        ),
      ),
    );
  }
}
