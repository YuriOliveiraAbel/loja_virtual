import 'package:flutter/material.dart';
import 'package:loja_virtual/conta/signup_widget.dart';
import 'package:loja_virtual/home/home-widget.dart';
import 'package:loja_virtual/login/login_widget.dart';
import 'package:loja_virtual/user/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: 'Flutters Clothing',
        theme: ThemeData(       
          primarySwatch: Colors.blue,
          primaryColor: Color.fromARGB(255, 4, 125, 141)
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

