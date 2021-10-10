import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ore_kota/common/color.dart';

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
        padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  questionName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: HexColor(TextMain),
                  ),
                ),
                Text(
                  "$peopleNumber人が回答",
                  style: TextStyle(
                    fontSize: 16,
                    color: HexColor(TextSub),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: HexColor(TextSub),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
