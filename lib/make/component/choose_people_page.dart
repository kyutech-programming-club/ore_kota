import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ore_kota/common/custom_button.dart';
import 'package:ore_kota/firebase/googleSignInMethod.dart';
import 'package:ore_kota/make/make_page.dart';

class ChoosePeoplePage extends StatefulWidget {
  ChoosePeoplePage(this.a, this.b, this.c, this.d, this.e);
  String a;
  String b;
  String c;
  String d;
  String e;
  @override
  _ChoosePeoplePageState createState() => _ChoosePeoplePageState(a, b, c, d, e);
}

class _ChoosePeoplePageState extends State<ChoosePeoplePage> {
  _ChoosePeoplePageState(this.a, this.b, this.c, this.d, this.e);
  String a;
  String b;
  String c;
  String d;
  String e;
  static const _alignments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
  ];

  var _index = 0;
  AlignmentGeometry get _alignment => _alignments[_index % _alignments.length];

  @override
  double _width = 0;
  List<bool> isChecked = [false, false, false, false, false, false, false];

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.blue;
  }

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    void _onTap() => setState(() => _width = size.height*0.9);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 16),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked[0],
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked[0] = value!;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      "https://avatars.githubusercontent.com/u/50654077?v=4",
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text("みき"),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked[1],
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked[1] = value!;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      "https://avatars.githubusercontent.com/u/39556764?v=4",
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text("わたる"),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked[2],
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked[2] = value!;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      "https://lh3.googleusercontent.com/ogw/ADea4I4CeGEhq1wHQ-ZAdj8-9xTBNZMVauyMDkaDXqdh8g=s64-c-mo",
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text("ふくだ"),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked[3],
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked[3] = value!;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      "https://i0.wp.com/www.naru-web.com/wp11/wp-content/uploads/2018/09/2018-09-21_173005.jpg?resize=350%2C350&ssl=1",
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text("だるま"),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked[4],
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked[4] = value!;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      "http://3.bp.blogspot.com/-qDc5kIFIhb8/UoJEpGN9DmI/AAAAAAABl1s/BfP6FcBY1R8/s1600/BlueHead.jpg",
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text("おほあり"),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: CustomButton(text: "確定", onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MakePage(isChecked, a, b, c, d, e))
                );
              },
              ),
            )
          ],
        ),
      ),
    );
  }
}

