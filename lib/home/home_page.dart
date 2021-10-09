import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ore_kota/question/question_page.dart';
import 'package:ore_kota/firebase/googleSignInMethod.dart';
import 'package:ore_kota/make/make_page.dart';
import 'package:ore_kota/answer/answer_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("homePage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              GoogleSignInMethod().currentUser!.uid,
            ),
            Text(
              GoogleSignInMethod().currentUser!.email!,
            ),
            Image.network(GoogleSignInMethod().currentUser!.photoURL!),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => QuestionPage())
                  );
                },
                child: Text("detail")
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AnswerPage()),
                );
              },
              child: Text("answer"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MakePage())
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
