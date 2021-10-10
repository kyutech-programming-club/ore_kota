import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ore_kota/firebase/googleSignInMethod.dart';
import 'package:ore_kota/home/component/question.dart';
import 'package:ore_kota/make/make_page.dart';
import 'package:ore_kota/answer/answer_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic data;

    void getData() async{
      final docRef = FirebaseFirestore.instance.collection("questions").doc(); // DocumentReference
      final docSnapshot = await docRef.get(); // DocumentSnapshot
      data = docSnapshot.exists ? docSnapshot.data() : null; // `data()`で中身を取り出
    }

    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text("homePage"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(

              //表示したいFiresotreの保存先を指定
                stream: FirebaseFirestore.instance
                    .collection('questions')
                    .snapshots(),

                //streamが更新されるたびに呼ばれる
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {

                  //データが取れていない時の処理
                  if (!snapshot.hasData) return const Text('Loading...');

                  return Question(
                      questionName: snapshot.data!.docs[0]['title'],
                      peopleNumber: 3,
                      description: snapshot.data!.docs[0]['description']
                  );
                }
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
