import 'package:flutter/material.dart';
import 'package:loja_virtual/drawer/custom_drawer.dart';
import 'package:loja_virtual/home/home_tab.dart';
import 'package:loja_virtual/products/product_tab.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Produtos'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
        ),
        Container(color: Colors.blue),
        Container(color: Colors.green)
      ],  
    );
  }
}