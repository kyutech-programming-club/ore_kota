import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ore_kota/common/custom_button.dart';
import 'package:ore_kota/firebase/googleSignInMethod.dart';
import 'package:ore_kota/make/component/choice.dart';
import 'package:ore_kota/make/component/choose_people_page.dart';

class MakePage extends StatefulWidget {
  const MakePage({Key? key}) : super(key: key);

  @override
  _MakePageState createState() => _MakePageState();
}

class _MakePageState extends State<MakePage> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void onTap() async{
      await FirebaseFirestore.instance
          .collection('questions') // コレクションID
          .doc() // ここは空欄だと自動でIDが付く
          .set({
        'title' : myController1.text,
        'description' : myController2.text,
        'user_id' : GoogleSignInMethod().currentUser!.uid,
        'choice.1' : myController3.text,
        'choice.2' : myController4.text,
        'choice.3' : myController5.text,
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("makePage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: myController1,
              decoration: InputDecoration(
                labelText: "タイトルを入力してください",
              ),
              textAlignVertical: TextAlignVertical(y: -1),
            ),
            TextField(
              controller: myController2,
              decoration: InputDecoration(
                labelText: "詳しい内容を入力してください",
              ),
              textAlignVertical: TextAlignVertical.bottom,
            ),
            TextField(
              controller: myController3,
              decoration: InputDecoration(
                labelText: "選択肢を入力",
              ),
            ),
            TextField(
              controller: myController4,
              decoration: InputDecoration(
                labelText: "選択肢を入力",
              ),
            ),
            TextField(
              controller: myController5,
              decoration: InputDecoration(
                labelText: "選択肢を入力",
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(text: "作成", onTap: onTap,),
                  SizedBox(height: 16),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ChoosePeoplePage())
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
