import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    

    return MaterialApp(
      // home:HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch : Colors.deepPurple),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/home",
      routes: {
        "/": (context)=> LoginPage(), //sirf ek hi homePage rhega
        "/home": (context)=> HomePage(),
        "/login": (context)=> const LoginPage()
      },
    );

  }
}