// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Venktesh";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hackathon app",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.blue,
      ),
        body:Center(
          child:Container(
            child: Text("Welcome to $days days of flutter with $name"),
          ),
        ),
        drawer: MyDrawer(),
      );
  }
}