import 'package:flutter/material.dart';
import 'package:ore_kota/firebase/userInfo.dart';
import 'package:ore_kota/home/home_page.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:ore_kota/firebase/googleSignInMethod.dart';


class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 50.0, 0, 100.0),
                child: Image.asset("assets/images/logo_main.png"),
              ),
              Text(
                'WELCOME TO OREKOTA',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () {
                  GoogleSignInMethod().googleSignIn();
                  UserInfo().setInfo();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomePage())
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
