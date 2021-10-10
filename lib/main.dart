import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ore_kota/firebase/userInfo.dart';
import 'package:ore_kota/home/home_page.dart';
import 'package:ore_kota/root/root_page.dart';

import 'firebase/googleSignInMethod.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: HexColor("#FFC86F"),
        fontFamily: "Sans",
      ),
      home: RootPage(),
    );
  }
}
