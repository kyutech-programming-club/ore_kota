import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ore_kota/answer/answer_page.dart';
import 'package:ore_kota/common/custom_button.dart';
import 'package:ore_kota/firebase/googleSignInMethod.dart';
import 'package:ore_kota/home/component/question.dart';
import 'package:ore_kota/make/make_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    dynamic data;
    List<bool> isChecked = [false, false, false, false, false, false, false];

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
        child: Stack(
          children: [
            Column(
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

                      if(snapshot.data!.docs[0]['user_id'] == GoogleSignInMethod().currentUser!.uid){
                        return Question(
                            questionName: snapshot.data!.docs[0]['title'],
                            peopleNumber: 3,
                            description: snapshot.data!.docs[0]['description']
                        );
                      }else{
                        return Container();
                      }
                    }
                )
              ],
            ),
            Visibility(
              visible: isShow,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.redAccent,
                child: Column(
                  children: [
                    Text(
                      "アンケートが届いています",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: CustomButton(text: "回答する", onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AnswerPage()),
                        );
                      },),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MakePage(isChecked))
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
