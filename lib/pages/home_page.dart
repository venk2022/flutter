// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/hackathon_app.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Venktesh";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(15, (index) => Hackathon.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Hackathon app"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    ); // Closing Scaffold
  } // Closing build method
} // Closing HomePage class
