import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/widgets/themes.dart';

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