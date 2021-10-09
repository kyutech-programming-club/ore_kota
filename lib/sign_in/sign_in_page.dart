import 'package:flutter/material.dart';
import 'package:ore_kota/firebase/userInfo.dart';
import 'package:ore_kota/home/home_page.dart';

import 'package:ore_kota/firebase/googleSignInMethod.dart';


class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("signInPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Google',
            ),
            ElevatedButton(
              onPressed: (){
                GoogleSignInMethod().googleSignIn();
                UserInfo().setInfo();
              },
              child: Text("サインイン"),)
          ],
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
