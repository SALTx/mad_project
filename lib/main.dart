import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/pages/home.dart';
import 'package:mad_project/pages/login.dart';
import 'customWidgets/MyCustomButton.dart';
import 'pages/register.dart';
import 'pages/homePages/Profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //detect the device os and return the appropriate home page
    return () {
      if (Platform.isIOS) {
        return CupertinoApp(
          routes: {
            '/home': (context) => HomePage(),
            '/login': (context) => LoginPage(),
            '/register': (context) => RegisterPage(),
          },
          title: 'MAD Project',
          theme: CupertinoThemeData(
            primaryColor: Colors.blue,
          ),
          home: StartPage(),
        );
      } else if (Platform.isAndroid) {
        return MaterialApp(
          routes: {
            '/home': (context) => HomePage(),
            '/login': (context) => LoginPage(),
            '/register': (context) => RegisterPage(),
            '/profile': (context) => Profile(),
          },
          title: 'MAD Project',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: StartPage(),
        );
      } else {
        return StartPage();
      }
    }();
  }
}

//asks the user if they want to login to an existing account or register a new one
class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Colors.orange],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/shopstore_logo.png',
                height: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome to ShopStore',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              MyCustomButton(
                text: 'Login',
                color: Colors.red,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              MyCustomButton(
                text: 'Register',
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
