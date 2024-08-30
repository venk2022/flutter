import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/hackathon_app.dart';
import 'package:velocity_x/velocity_x.dart';

class Cartmodel{
  //hackathon fields
  late Hackathon _hackathon;

  //collection of IDs - storing IDs of each item
  final List<int> _itemIds = [];

  //Get Hackathon
  Hackathon get hackathon => _hackathon;

  set hackathon(Hackathon newHackathon){
    assert(newHackathon!=null);
    _hackathon = newHackathon;
  }

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => _hackathon.getbyId(id)).toList();

  //Get total price
  num get totalprice => items.fold(0, (total,current)=> total + current.price);


  //Remove item
  void remove(Item item){
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<Mystore>{
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }

}