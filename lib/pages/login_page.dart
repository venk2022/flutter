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
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
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
          ),
           SizedBox(
            height: 40.0,
          ),
          InkWell(
            onTap: () async{
              setState(() {
                changebutton=true;
              });
              await Future.delayed(Duration(seconds: 2));
              Navigator.pushNamed(context, MyRoutes.homeRoute);

            },
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
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                //shape: changebutton?BoxShape.circle:BoxShape.rectangle,
                borderRadius: BorderRadius.circular(changebutton?40:10),
              ),
            
            ),
          ),
          // ElevatedButton(
          //   child: Text("Login",style: TextStyle(
          //     fontSize: 20.0,
          //     fontWeight: FontWeight.bold,
          //   ),
          //   ),
          //   style: TextButton.styleFrom(minimumSize: Size(150,40),backgroundColor: Colors.amberAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
          //   onPressed: () {
          //   Navigator.pushNamed(context, MyRoutes.homeRoute);
          //   },
          // )

          ],
          ),
          ),
        ],
      )
    );
  }
}