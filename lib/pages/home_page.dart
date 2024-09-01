// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/hackathon_app.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/home_widgets/hackathon_header.dart';
import 'package:flutter_application_1/widgets/home_widgets/hackathon_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;



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
    final _cart = (VxState.store as Mystore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation,RemoveMutation},
        builder:(context,_,__)=> FloatingActionButton(
          onPressed: ()=> Navigator.pushNamed(context,MyRoutes.cartRoute),
          child: Icon(CupertinoIcons.cart,color: Colors.white,),
        ).badge(
            color: Vx.blue50,
            size: 20,
            count: _cart.items.length,
          textStyle: TextStyle(color: Colors.black,
          fontWeight: FontWeight.bold)
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children : [
              Hackathonheader(),
              if(Hackathon.items != null && Hackathon.items.isNotEmpty)
                Hackathonlist().py16().expand()
              else
                CircularProgressIndicator(
                  color: Colors.blue,
                ).centered().expand(),
        ],
      ),
    ),
    ),
    ); // Closing Scaffold
  } } // Closing HomePage class












