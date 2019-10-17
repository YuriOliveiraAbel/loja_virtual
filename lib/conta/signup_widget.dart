import 'package:flutter/material.dart';
import 'package:loja_virtual/user/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _adressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
        title: Text('Criar conta'),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator(),);
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Nome Completo'
                  ),
                  validator: (text){
                    if(text.isEmpty) return 'Nome Invalido';
                  },
                ),
                SizedBox(height: 16,),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'E-mail'
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text){
                    if(text.isEmpty || !text.contains('@')) return 'Email Invalido';
                  },
                ),
                SizedBox(height: 16,),
                TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(
                    hintText: 'Senha'
                  ),
                  obscureText: true,
                  validator: (text){
                    if(text.isEmpty || text.length < 6) return 'Senha inválida';
                  },
                ),
                SizedBox(height: 16,),
                TextFormField(
                  controller: _adressController,
                  decoration: InputDecoration(
                    hintText: 'Endereço'
                  ),
                  validator: (text){
                    if(text.isEmpty) return 'Endereço inválida';
                  },
                ),
                SizedBox(height: 16,),
                RaisedButton(
                  child: Text('Criar conta',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: (){
                    if(_formKey.currentState.validate()){

                      Map<String, dynamic> userData = {
                        'name': _nameController.text,
                        'email': _emailController.text,
                        'adress': _adressController.text
                      };

                      model.singUp(
                        userData: userData,
                        pass: _passController.text,
                        onSuccess: _onSuccess,
                        onFail: _onFail 
                      );
                    }
                  },
                )               
              ],
            ),
          );
        },
      )
    );
  }

  void _onSuccess(){
    _scafoldKey.currentState.showSnackBar(
      SnackBar(content: Text('Usuário criado com sucesso!'),
        backgroundColor: Theme.of(context).primaryColor,
        duration: Duration(seconds: 2),
      )
    );
    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.of(context).pop();
    });
  }

  void _onFail(){
    _scafoldKey.currentState.showSnackBar(
      SnackBar(content: Text('Falha ao criar o usuário!'),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      )
    );
  }
}