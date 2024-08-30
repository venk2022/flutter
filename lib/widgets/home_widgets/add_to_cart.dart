import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/hackathon_app.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item hackathon;
  AddToCart({
    super.key,
    required this.hackathon
  });

  final _cart = Cartmodel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(hackathon) ?? false;
    return ElevatedButton(onPressed: (){
      if(!isInCart) {
        isInCart = isInCart.toggle();
        final _hackathon = Hackathon();
        _cart.hackathon = _hackathon;
        _cart.add(hackathon);
        //setState(() {});
      }
    },
        style:ElevatedButton.styleFrom(
          backgroundColor: context.theme.colorScheme.primary,
        ),
        child: isInCart ? Icon(Icons.done,
          color: context.theme.canvasColor,)
            : Icon(CupertinoIcons.cart_badge_plus,color: context.theme.canvasColor,),);
  }
}