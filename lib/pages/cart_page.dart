import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/pages/home_details_page.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.theme.colorScheme.secondary).xl4.make(),
      ),

      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _cartTotal(),
        ],
      ),
    );
  }
}


class _cartTotal extends StatelessWidget {
  const _cartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = Cartmodel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: "\$${_cart.totalprice}".text.xl5.color(context.theme.colorScheme.secondary).make(),
              ), ),
          30.widthBox,
          ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "Buying not suppored yet.".text.make(),
            ));
          },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                context.theme.colorScheme.secondary),
              shape: MaterialStateProperty.all(
                StadiumBorder(),
              )
            ),
            child: "Buy".text.xl.bold.color(context.theme.canvasColor).make(),
          ).w32(context)
        ],
      ),
    );
  }
}


class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = Cartmodel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty?
    "Empty Cart".text.xl3.color(context.theme.colorScheme.primary).makeCentered()
        :ListView.builder(
      itemCount: _cart.items?.length?? 0 ,
      itemBuilder: (context,index)=> ListTile(
        leading: Icon(Icons.done,
        color: context.theme.colorScheme.primary,),
        trailing: IconButton(onPressed: (){
          _cart.remove(_cart.items[index]);
          setState(() {});
        },
          icon: Icon(Icons.remove_circle_outline,
              color: context.theme.colorScheme.primary),
        ),
          title: _cart.items[index].name.text.color(context.theme.colorScheme.primary).make(),
      ),
    );
  }
}


