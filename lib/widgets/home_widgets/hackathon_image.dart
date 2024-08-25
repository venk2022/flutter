import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Hackathonimage extends StatelessWidget {
  final String image;

  const Hackathonimage({super.key, required this.image}): assert(image !=null);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(context.canvasColor).make().p16().w40(context);
  }
}