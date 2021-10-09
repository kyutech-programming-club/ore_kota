import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ore_kota/answer/model/vibrate_model.dart';
import 'package:vibration/vibration.dart';
import 'package:provider/provider.dart';

class AnswerPage extends StatelessWidget {
  const AnswerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("answer"),
      ),
      body: ChangeNotifierProvider<VibrateModel>(
        create: (_) => VibrateModel()..startVibrate(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Answer',
              ),
              Consumer<VibrateModel>(builder: (context, model, child) {
                return ElevatedButton(
                  onPressed: () {
                    model.stopVibrate();
                  },
                  child: Text("stop"),
                );
              },
              ),
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
