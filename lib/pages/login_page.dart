// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;

  final _formkey = GlobalKey<FormState>();

  Future<void>moveToHome(BuildContext context) async{
    if(_formkey.currentState?.validate()??false){
    setState(() {
       changebutton=true;
    });
    await Future.delayed(Duration(seconds: 2));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      changebutton=false;
    });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Image.asset("assets/images/login_image.png",
            fit: BoxFit.cover,
            ),
             SizedBox(
              height: 20.0,
            ),
             Text("Welcome $name",style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            ),
             SizedBox(
              height: 20.0,
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
            child: Column(
              children: [
              TextFormField(
              decoration: InputDecoration(
                hintText: "Enter UserName",
                labelText: "UserName",
              ),
              validator: (value){
                if( value==null ||value.isEmpty){
                  return "Username cannot be empty";
                }

                return null;
              },
              onChanged: (value){
                name = value;
                setState(() {});
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
              ),
              validator: (value){
                if(value== null ||value.isEmpty  ){
                  return "Password cannot be empty";
                }
               else if(value.length < 8){
                  return "Password length must be atleast of 8 characters";
                }

                return null;
              },
            ),
             SizedBox(
              height: 40.0,
            ),
            Material(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(changebutton?40:10),
              child: InkWell(
                onTap: () => moveToHome(context),
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  width: changebutton?50:150,
                  height: 40,
                  alignment: Alignment.center,
                  child:changebutton?Icon(
                    Icons.done,
                    color: Colors.white,
                  ) : Text(
                    "Login",
                    style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                
                ),
              ),
            ),
        
            ],
            ),
            ),
          ],
        ),
      )
    );
  }
}