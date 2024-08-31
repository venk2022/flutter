import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
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
    final Cartmodel _cart = (VxState.store as Mystore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: VxBuilder(
                  builder: (context,_,__){
                  return "\$${_cart.totalprice}".text.xl5.color(context.theme.colorScheme.secondary).make();
                },
                  mutations: {RemoveMutation},
                ),
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


class _CartList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return VxBuilder(
        mutations: {RemoveMutation},
        builder: (context, _, __)
    {
      final Cartmodel _cart = (VxState.store as Mystore).cart;
      return _cart.items.isEmpty ?
      "Empty Cart".text.xl3.color(context.theme.colorScheme.primary)
          .makeCentered()
          : ListView.builder(
        itemCount: _cart.items?.length ?? 0,
        itemBuilder: (context, index) =>
            ListTile(
              leading: Icon(Icons.done,
                color: context.theme.colorScheme.primary,),
              trailing: IconButton(
                onPressed: () => RemoveMutation(_cart.items[index]),
                icon: Icon(Icons.remove_circle_outline,
                    color: context.theme.colorScheme.primary),
              ),
              title: _cart.items[index].name.text.color(
                  context.theme.colorScheme.primary).make(),
            ),
      );
    },
    );
  }
}


