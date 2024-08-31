import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/hackathon_app.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item hackathon;

  AddToCart({
    super.key,
    required this.hackathon,
  });

  @override
  Widget build(BuildContext context) {
    return VxBuilder(
      mutations: {AddMutation,RemoveMutation},
      builder: (context, _, __) {
        final Cartmodel _cart = (VxState.store as Mystore).cart;
        bool isInCart = _cart.items.contains(hackathon);

        return ElevatedButton(
          onPressed: () {
            if (!isInCart) {
              AddMutation(hackathon);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: context.theme.colorScheme.primary,
          ),
          child: isInCart
              ? Icon(
            Icons.done,
            color: context.theme.canvasColor,
          )
              : Icon(
            CupertinoIcons.cart_badge_plus,
            color: context.theme.canvasColor,
          ),
        );
      },
    );
  }
}
