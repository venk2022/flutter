import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/hackathon_app.dart';

class Cartmodel{

  static final cartmodel = Cartmodel._internal();

  Cartmodel._internal();

  factory Cartmodel() => cartmodel;


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

  //Add item
  void add(Item item){
    _itemIds.add(item.id);
  }

  //Remove item
  void remove(Item item){
    _itemIds.remove(item.id);
  }
}