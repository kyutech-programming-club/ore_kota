import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ore_kota/common/custom_button.dart';
import 'package:ore_kota/firebase/googleSignInMethod.dart';
import 'package:ore_kota/home/home_page.dart';
import 'package:ore_kota/make/component/choice.dart';
import 'package:ore_kota/make/component/choose_people_page.dart';

class MakePage extends StatefulWidget {

  MakePage(this.isChecked, this.a, this.b, this.c, this.d, this.e);
  List<bool> isChecked = [false, false, false, false, false, false, false];
  String a;
  String b;
  String c;
  String d;
  String e;

  @override
  _MakePageState createState() => _MakePageState(this.isChecked, this.a, this.b, this.c, this.d, this.e);
}

class _MakePageState extends State<MakePage> {
  _MakePageState(this.isChecked, this.a, this.b, this.c, this.d, this.e);
  List<bool> isChecked = [false, false, false, false, false, false, false];
  var myController1 = TextEditingController();
  var myController2 = TextEditingController();
  var myController3 = TextEditingController();
  var myController4 = TextEditingController();
  var myController5 = TextEditingController();
  String a;
  String b;
  String c;
  String d;
  String e;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    myController1.text = a;
    myController2.text = b;
    myController3.text = c;
    myController4.text = d;
    myController5.text = e;
  }

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
        'choiceq' : myController3.text,
        'choicew' : myController4.text,
        'choicee' : myController5.text,
      });
    }
    myController1.text = a;
    myController2.text = b;
    myController3.text = c;
    myController4.text = d;
    myController5.text = e;

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
                  CustomButton(text: "作成", onTap: (){
                    onTap();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage())
                    );
                  },),
                  SizedBox(height: 16),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor("#FFC86F"),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ChoosePeoplePage(myController1.text, myController2.text, myController3.text, myController4.text, myController5.text))
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.wc),
      ),
    );
  }
}
