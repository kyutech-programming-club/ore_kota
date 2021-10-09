import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    void _onTap() => setState(() => _width = size.height*0.9);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ),
      body: Align(
        alignment: Alignment(0, 1),
          child: AnimatedContainer(
            width: size.width*0.8,
            height: _width,
            duration: Duration(milliseconds: 500),
            color: Colors.orange,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _onTap),
    );
  }
}

