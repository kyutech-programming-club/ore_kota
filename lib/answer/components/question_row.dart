import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ore_kota/common/color.dart';

class QuestionRow extends StatelessWidget {
  const QuestionRow({Key? key, required this.choice, required this.number,}) : super(key: key);
  final String choice;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              choice,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: HexColor(TextMain),
            ),
          ),
          Text(
              number,
            style: TextStyle(
              fontSize: 16
            ),
          )
        ],
      ),
    );
  }
}
