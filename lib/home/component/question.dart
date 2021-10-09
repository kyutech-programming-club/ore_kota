import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  questionName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#191300"),
                  ),
                ),
                Text(
                  "$peopleNumber人が回答",
                  style: TextStyle(
                    fontSize: 12,
                    color: HexColor("#757575"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
                color: HexColor("#757575"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
