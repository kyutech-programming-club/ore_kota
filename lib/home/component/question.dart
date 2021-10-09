import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({
    Key? key,
    required this.questionName,
    required this.peopleNumber,
    required this.description,
  }) : super(key: key);

  final String questionName;
  final int peopleNumber;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(questionName),
                Text("$peopleNumber人が回答")
              ],
            ),
            Text(description),
          ],
        ),
      ),
    );
  }
}
