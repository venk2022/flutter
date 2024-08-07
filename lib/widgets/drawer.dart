// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageurl = "https://documents.iplt20.com/ipl/IPLHeadshot2024/2.png";
    return Drawer(
      elevation: 0.0,
      child: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                accountName: Text("Venktesh"),
                accountEmail: Text("Venkteshbadgaiyan@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageurl),
                ),
               ),
              ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home , 
                color: Colors.white,
                ),
                title: Text(
                  "Home",
                  textScaler: TextScaler.linear(1.5),
                  style: TextStyle(
                  color: Colors.white
                    ),
                    ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled , 
                color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  textScaler: TextScaler.linear(1.5),
                  style: TextStyle(
                  color: Colors.white
                    ),
                    ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail , 
                color: Colors.white,
                ),
                title: Text(
                  "Email",
                  textScaler: TextScaler.linear(1.5),
                  style: TextStyle(
                  color: Colors.white
                    ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}