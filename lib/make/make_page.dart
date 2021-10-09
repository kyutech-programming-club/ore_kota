import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("makePage"),
      ),
      body: Center(
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
            Choice(),
            Choice(),
            Choice(),
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
