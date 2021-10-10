import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ore_kota/common/custom_button.dart';
import 'package:ore_kota/firebase/googleSignInMethod.dart';

class ChoosePeoplePage extends StatefulWidget {
  @override
  _ChoosePeoplePageState createState() => _ChoosePeoplePageState();
}

class _ChoosePeoplePageState extends State<ChoosePeoplePage> {
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
                      GoogleSignInMethod().currentUser!.photoURL!,
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(GoogleSignInMethod().currentUser!.displayName!),
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
                      GoogleSignInMethod().currentUser!.photoURL!,
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(GoogleSignInMethod().currentUser!.displayName!),
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
                      GoogleSignInMethod().currentUser!.photoURL!,
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(GoogleSignInMethod().currentUser!.displayName!),
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
                      GoogleSignInMethod().currentUser!.photoURL!,
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(GoogleSignInMethod().currentUser!.displayName!),
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
                      GoogleSignInMethod().currentUser!.photoURL!,
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(GoogleSignInMethod().currentUser!.displayName!),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked[5],
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked[5] = value!;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      GoogleSignInMethod().currentUser!.photoURL!,
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(GoogleSignInMethod().currentUser!.displayName!),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked[6],
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked[6] = value!;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      GoogleSignInMethod().currentUser!.photoURL!,
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(GoogleSignInMethod().currentUser!.displayName!),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: CustomButton(text: "確定", onTap: (){

              },
              ),
            )
          ],
        ),
      ),
    );
  }
}

