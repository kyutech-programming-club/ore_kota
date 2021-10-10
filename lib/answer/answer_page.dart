import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ore_kota/answer/model/vibrate_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ore_kota/answer/components/question_row.dart';
import 'package:ore_kota/common/color.dart';
import 'package:ore_kota/common/custom_button.dart';
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
                    Text(
                      'タイトル',
                      style: TextStyle(
                        fontSize: 32,
                        color: HexColor(TextMain),
                      ),
                    ),
                    Text(
                      "作成者：maker",
                      style: TextStyle(
                        fontSize: 16,
                        color: HexColor(TextSub),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "description",
                      style: TextStyle(
                        fontSize: 16,
                        color: HexColor(TextSub),
                      ),
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
                  QuestionRow(choice: "選択肢", number: "32"),
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
                  QuestionRow(choice: "選択肢", number: "32"),
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
                  QuestionRow(choice: "選択肢", number: "32"),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Consumer<VibrateModel>(builder: (context, model, child) {
                      return CustomButton(
                        onTap: () {
                          model.stopVibrate();
                        },
                        text: "送信",
                      );
                    },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Vibration.vibrate(duration: 5000, amplitude: 255);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
