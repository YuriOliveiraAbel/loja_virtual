import 'package:flutter/material.dart';
import 'package:loja_virtual/products/category-options/categorys/product/product_widget.dart';
import 'package:loja_virtual/products/product-model.dart';

class ProductTile extends StatelessWidget {

  final String type;
  final ProductData product;

  ProductTile(this.type, this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(//inkWeel ou gestureDetecture diferença é que o ink realiza um efeito de click
      onTap: (){
        Navigator.of(context).push(//chamando outra tela a partir do navigation
          MaterialPageRoute(builder: (context)=>ProductScreen(product))
        );
      },
      child: Card(
        child: type == 'grid' ?//caso for grid retorno uma collum se não retorno um Row
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,//Imagem esticada
            mainAxisAlignment: MainAxisAlignment.start,//Para fica no inico do card
            children: <Widget>[
              AspectRatio(
                aspectRatio: 0.85,//define formato da imagem 
                child: Image.network(
                  product.images[0],
                  fit: BoxFit.cover,//irá cobrir todo espaço disponivel
                ),
              ),
              Expanded(//pega todo o espaço disponivel
                child: Container(
                  padding: EdgeInsets.all(8),//define tamanho e local onde vai ter o padding
                  child: Column(
                    children: <Widget>[
                      Text(product.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        'R\$ ${product.price.toStringAsFixed(2)}',//fixa o tamanho de casas
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
          : Row(
            children: <Widget>[
              //Flexible divide o opaço do widget conforme tamanho do dispositivo
              Flexible(
                flex: 1,
                child: Image.network(
                  product.images[0],
                  fit: BoxFit.cover,//irá cobrir todo espaço disponivel
                  height: 250,
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8),//define tamanho e local onde vai ter o padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,//ficar alinha a esquerda
                    children: <Widget>[
                      Text(product.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        'R\$ ${product.price.toStringAsFixed(2)}',//fixa o tamanho de casas
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
      ),
    );
  }
}