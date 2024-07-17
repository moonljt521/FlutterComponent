import 'dart:math';

import 'package:flutter/material.dart' hide Page;
import 'package:joinu_component/component/dash_widget.dart';
import '../common/index.dart';
import '../component/translate_with_expanded_painting_area.dart';
import '../component/watermark.dart';

class DashRoute extends StatelessWidget {
   DashRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: 7,
        itemBuilder: (ctx , index){
          return getDashLine(index);
    });

  }

  final _colors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.black,
    Colors.pink,
    Colors.grey,
    Colors.black26,
  ];

  _buildRandomColor(int i) => _colors[Random().nextInt(i)];

  Widget getDashLine(int index) {
    double height = (index ++).toDouble();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 10),
      child: DottedLine(height: height, color: _buildRandomColor(index),),
    );
  }



}
