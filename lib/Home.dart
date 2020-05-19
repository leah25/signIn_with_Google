import 'package:flutter/material.dart';


import 'firebase_auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue,
        title:Text('Home Page'),
      ),
      body: Container(
        child:SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Home page'),


                RaisedButton(
                  child: Text('Log out'),
                  onPressed:(){
                    AuthProvider().logout();
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}