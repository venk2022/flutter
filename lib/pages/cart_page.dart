import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_details_page.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
      appBar: AppBar(
        backgroundColor: MyTheme.creamcolor,
        title: "Cart".text.color(Colors.black).xl4.make(),
      ),
    );
  }
}
