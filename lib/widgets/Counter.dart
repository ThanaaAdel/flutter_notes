// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unnecessary_import, non_constant_identifier_names


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  // define all varibles 
   final int Counttask;
   final int alltask;
  const Counter({super.key, required this.Counttask, required this.alltask});
  @override
  Widget build(BuildContext context) {
    return Padding(
      // counter of the list 2/4 
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          "$Counttask/$alltask",
          style: TextStyle(
              color:Counttask==alltask ?Color.fromARGB(255, 70, 235, 155):Colors.white
              , fontSize: 27
              , fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
