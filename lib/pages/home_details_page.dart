import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/hackathon_app.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item hackathon;

  const HomeDetailsPage({super.key, required this.hackathon})
      :assert(hackathon!=null);


  @override
  Widget build(BuildContext context) {

    String dummyText = lorem(paragraphs: 1,words: 50);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor:  context.theme.canvasColor,
      bottomNavigationBar: Container(
        color: context.theme.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${hackathon.price}".text.xl4.red800.bold.make(),
            AddToCart(hackathon: hackathon).wh(100, 50)
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
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    hackathon.name.text.xl4.color(context.accentColor).bold.make(),
                    hackathon.desc.text.center.color(MyTheme.lightbluish).lg.textStyle(context.captionStyle).bold.make(),
                    //dummy text
                    dummyText.text.center.color(Colors.grey).lg.bold.make().p16(),
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
