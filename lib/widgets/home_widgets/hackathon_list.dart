import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/hackathon_app.dart';
import 'package:flutter_application_1/pages/home_details_page.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'hackathon_image.dart';

class Hackathonlist extends StatelessWidget {
  const Hackathonlist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Hackathon.items.length,
      itemBuilder: (context,index){
        final hackathon = Hackathon.items[index];
        return InkWell(
            onTap: ()=> Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>HomeDetailsPage(
                  hackathon: hackathon,
            ),
            ),
            ),
            child: HackathonItem(hackathon: hackathon)
        );
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
            Hero(
              tag: Key(hackathon.id.toString()),
              child: Hackathonimage(
                image: hackathon.image,
              ),
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    hackathon.name.text.lg.color(context.theme.colorScheme.secondary).bold.make(),
                    hackathon.desc.text.color(Colors.indigo).textStyle(context.captionStyle).bold.make(),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "\$${hackathon.price}".text.color(Colors.cyan).bold.make(),
                        AddToCart(hackathon:hackathon)
                      ],
                    )
                  ],
                )
            )
          ],
        )
    ).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}

