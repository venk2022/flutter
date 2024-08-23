// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/hackathon_app.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Venktesh";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(Duration(seconds: 2));
    final datajson =  await rootBundle.loadString("assets/files/data.json");
    final decodedata = jsonDecode(datajson);
    var productdata = decodedata["products"];
    Hackathon.items = List.from(productdata)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hackathon App",
        style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (Hackathon.items!=null && Hackathon.items.isNotEmpty)?
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 15),
            itemBuilder: (context,index){
              final item = Hackathon.items[index];
              return Card (
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: GridTile(
                      header: Container(
                          child: Text(item.name,
                          style: TextStyle(color: Colors.white),),
                          padding:const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.purple
                          ),
                      ),
                      child: Image.network(item.image),
                      footer: Container(
                        child: Text(item.price.toString(),
                          style: TextStyle(color: Colors.white),),
                        padding:const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.black
                        ),
                      ),
                  ));
            },
            itemCount: Hackathon.items.length,
        )
            :Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ),
      drawer: MyDrawer(),
    ); // Closing Scaffold
  } } // Closing HomePage class
