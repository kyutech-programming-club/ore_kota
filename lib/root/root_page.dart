import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ore_kota/firebase/googleSignInMethod.dart';
import 'package:ore_kota/home/home_page.dart';
import 'package:ore_kota/signIn/signIn_page.dart';

class RootPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    User? user = GoogleSignInMethod().currentUser;

    return user == null ? SignInPage() : HomePage();
  }
}
