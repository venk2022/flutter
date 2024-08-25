import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/hackathon_app.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item hackathon;

  const HomeDetailsPage({super.key, required this.hackathon})
      :assert(hackathon!=null);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor:  MyTheme.creamcolor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${hackathon.price}".text.xl4.red800.bold.make(),
            ElevatedButton(onPressed: (){},
                style:ElevatedButton.styleFrom(
                  backgroundColor: MyTheme.darkbluish,
                ),
                child: "Buy".text.xl2.color(Colors.white).bold.make(),
            ).wh(100, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(hackathon.id.toString()),
                child: Image.network(hackathon.image),
            ).h32(context),
            Expanded(child: VxArc(
              height: 0,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    hackathon.name.text.xl4.color(MyTheme.darkbluish).bold.make(),
                    hackathon.desc.text.center.color(Colors.blue).lg.textStyle(context.captionStyle).bold.make(),
                  ],
                ).py32(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
