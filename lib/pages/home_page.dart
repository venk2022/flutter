// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/hackathon_app.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: MyTheme.creamcolor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children : [
              Hackathonheader(),
              if(Hackathon.items != null && Hackathon.items.isNotEmpty)
                Hackathonlist().expand()
              else
                Center(child: CircularProgressIndicator(),)
        ],
      ),
    ),
    ),
    ); // Closing Scaffold
  } } // Closing HomePage class


class Hackathonheader extends StatelessWidget {
  const Hackathonheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children : [
        "Hackathon App".text.xl5.bold.color(MyTheme.darkbluish).make(),
        "Trending Laptops".text.xl3.bold.make(),

      ],
    );
  }
}



class Hackathonlist extends StatelessWidget {
  const Hackathonlist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Hackathon.items.length,
      itemBuilder: (context,index){
        final hackathon = Hackathon.items[index];
        return HackathonItem(hackathon: hackathon);
      },
    );
  }
}


class HackathonItem extends StatelessWidget {
  final Item hackathon;

  const HackathonItem({super.key, required this.hackathon}):assert(hackathon !=null);



  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hackathonimage(
            image: hackathon.image,
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    hackathon.name.text.lg.color(MyTheme.darkbluish).bold.make(),
                    hackathon.desc.text.textStyle(context.captionStyle).make(),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "\$${hackathon.price}".text.color(Colors.black).bold.make(),
                        ElevatedButton(onPressed: (){},
                            style:ElevatedButton.styleFrom(
                          backgroundColor: MyTheme.darkbluish,
                        ),
                            child: "Buy".text.color(Colors.white).bold.make())
                      ],
                    )
                ],
              )
          )
        ],
      )
    ).white.roundedLg.square(150).make().py16();
  }
}


class Hackathonimage extends StatelessWidget {
  final String image;

  const Hackathonimage({super.key, required this.image}): assert(image !=null);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(MyTheme.creamcolor).make().p16().w40(context);
  }
}


