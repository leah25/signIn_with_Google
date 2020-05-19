import 'package:flutter/material.dart';
import 'firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  @override
  void initState(){
    super.initState();
    _emailController =TextEditingController(text:" ");
    _passwordController =TextEditingController(text:" ");

  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.topLeft,
                  child: Text('Welcome...', style:TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.center,
                child: Text('Login', style:TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color:Colors.blue),),),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller:_emailController,
                    decoration: InputDecoration(
                      labelText: 'Email'
                    ),

                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller:_passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                  child: Text('Login'),
                  hoverColor: Colors.blue,
                  onPressed: () async{
                    if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
                    print ('Email and password is empty');
                    return;
                    }

                   bool res = await AuthProvider().signInWithEmail(_emailController.text,_passwordController.text);
                     if(!res){
                      print('login failed');
                    }
                  },

                ),
                SizedBox(height: 30.0,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Divider(color: Colors.blue),
                  ),
                ),
                 Container(
                   child: RaisedButton(
                     color: Colors.blue,

                     child: Text('Sign In with Google',style:TextStyle(decorationColor: Colors.blue),),

                       onPressed: () async{
                      bool res = await AuthProvider().loginWithGoogle();
                      if(!res)
                        print('error');
                       }
                       ),
                 ),

              ],
            ),
          ],
        ),),
      ),
    );
  }


}

