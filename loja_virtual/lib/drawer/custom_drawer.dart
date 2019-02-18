import 'package:flutter/material.dart';
import 'package:loja_virtual/drawer/drawer-tiles/drawer_tile.dart';
import 'package:loja_virtual/login/login_widget.dart';
import 'package:loja_virtual/user/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 203, 236, 241),
            Colors.white
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
    );

    return SizedBox(
      width: 285,
      child: Drawer(
        child: Stack(
          children: <Widget>[
            _buildDrawerBack(),
            ListView(
              padding: EdgeInsets.only(left: 30, top: 16),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
                  height: 170,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 8,
                        right: 20,
                        child: Text('FIGURE\nSTORE', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold,),),
                      ),
                      Positioned(
                        top: 8,
                        left: 4,
                        child: Image.network('https://firebasestorage.googleapis.com/v0/b/lojaflutter-25775.appspot.com/o/icones%2FIcons8-Windows-8-Cinema-Avengers.ico?alt=media&token=91d95b8a-891c-4512-a908-b18289f7d414', height: 80, width: 80)
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: ScopedModelDescendant<UserModel>(
                          builder: (context, child, model){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Olá, ${!model.isLoggedIn() ? '' : model.userData['name']}', 
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    !model.isLoggedIn() ?
                                    'Entre ou cadastre-se' :
                                    'Sair',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  onTap: (){
                                    if(!model.isLoggedIn()){
                                      Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context)=>LoginScreen())
                                      );
                                    }else{
                                      model.singOut();
                                    }       
                                  },
                                )
                              ],
                            );
                          }
                        )
                      )   
                    ],
                  ),
                ),
                Divider(),
                DrawerTile(Icons.home, 'Início', pageController, 0),
                DrawerTile(Icons.list, 'Produtos', pageController, 1),
                DrawerTile(Icons.location_on, 'Lojas', pageController, 2),
                DrawerTile(Icons.playlist_add_check, 'Meus Pedidos', pageController, 3),
              ],
            )
          ],
        ),
      ),
    );
  }
}