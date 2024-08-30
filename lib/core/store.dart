import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/hackathon_app.dart';
import 'package:velocity_x/velocity_x.dart';

class Mystore extends VxStore{
  late Hackathon hackathon;
  late Cartmodel cart;

  Mystore(){
    hackathon = Hackathon();
    cart = Cartmodel();
    cart.hackathon = hackathon;
  }
}