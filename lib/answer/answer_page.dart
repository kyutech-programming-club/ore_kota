import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ore_kota/answer/model/vibrate_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ore_kota/answer/components/question_row.dart';
import 'package:ore_kota/common/color.dart';
import 'package:ore_kota/common/custom_button.dart';
import 'package:ore_kota/home/home_page.dart';
import 'package:vibration/vibration.dart';
import 'package:provider/provider.dart';

class AnswerPage extends StatefulWidget {
  const AnswerPage({Key? key}) : super(key: key);

  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    String choice1;
    String choice2;
    String choice3;
    return  Scaffold(
      appBar: AppBar(
        title: Text("answer"),
      ),
      body: ChangeNotifierProvider<VibrateModel>(
          create: (_) => VibrateModel()..startVibrate(),
          child: Padding(
            padding: EdgeInsets.only(left: 8, right: 16, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 32),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    children: [
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
                            return Text(
                              snapshot.data!.docs[1]['title'],
                              style: TextStyle(
                                fontSize: 32,
                                color: HexColor(TextSub),
                              ),
                            );
                          }
                      ),
                      Text(
                        "作成者：maker",
                        style: TextStyle(
                          fontSize: 16,
                          color: HexColor(TextSub),
                        ),
                      ),
                      SizedBox(height: 8),
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
                            return Text(
                              snapshot.data!.docs[1]['description'],
                              style: TextStyle(
                                fontSize: 16,
                                color: HexColor(TextSub),
                              ),
                            );
                          }
                      ),
                      SizedBox(height: 16),
                      Text(
                        "人が回答",
                        style: TextStyle(
                          fontSize: 12,
                          color: HexColor(TextSub),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked1,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked1 = value!;
                        });
                      },
                    ),
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
                          return QuestionRow(choice: snapshot.data!.docs[1]['choiceq'], number: "3");
                        }
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked2,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked2 = value!;
                        });
                      },
                    ),
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
                          return QuestionRow(choice: snapshot.data!.docs[1]['choicew'], number: "3");
                        }
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked3,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked3 = value!;
                        });
                      },
                    ),
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
                          return QuestionRow(choice: snapshot.data!.docs[1]['choicee'], number: "3");
                        }
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StreamBuilder<QuerySnapshot>(

                        //表示したいFiresotreの保存先を指定
                          stream: FirebaseFirestore.instance
                              .collection('questions')
                              .snapshots(),


                          //streamが更新されるたびに呼ばれる
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            Map<String, dynamic> data = {
                              "judge": true,
                            };
                            return Consumer<VibrateModel>(builder: (context, model, child) {
                              return CustomButton(
                                onTap: () {
                                  model.stopVibrate();
                                  FirebaseFirestore.instance
                                  .collection('questions')
                                  .doc('GyV8p2IQ3Wyp37jeH7dU')
                                  .update(data);
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => HomePage())
                                  );
                                },
                                text: "送信",
                              );
                            },
                            );}
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
