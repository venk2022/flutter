import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/hackathon_app.dart';



class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) :
        assert(item != null),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: StadiumBorder(),
      shadowColor: Colors.purpleAccent,
      child: ListTile(
        onTap: (){
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name,
        style: TextStyle(
            fontWeight: FontWeight.bold),),
        trailing: Text(
            "\$${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(item.desc,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    );
  }
}
