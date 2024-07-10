

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class StickList extends StatefulWidget {
  const StickList({super.key}); // Add a constructor with a key parameter

  @override
  State<StickList> createState() => _StickListState();
}

class _StickListState extends State<StickList> {

  @override
  void initState() {
    super.initState();
    _createDataList();
  }

  @override
  Widget build(BuildContext context) => DefaultStickyHeaderController(
    child: CustomScrollView(
      reverse: false,
      slivers: _buildSlivers(),
    ),

  );

  final _colors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.white,
    Colors.pink,
    Colors.grey,
    Colors.black26,
  ];

  _buildRandomColor(int i) => _colors[Random().nextInt(i)];

  _buildSlivers() {
    var list = <Widget>[];
    list.add(SliverStickyHeader(
      header: Container(
        height: 200,
        color: Colors.pink,
        alignment: Alignment.center,
        child: Text("header"),
      ),
      sticky: false,
    ));

    dataList.forEach((stick) {
      list.add(SliverStickyHeader(
        header: Container(
          color: _buildRandomColor(stick.index),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(10),
          child: Text('列表头： ${stick.index}'),
        ),

        sliver: SliverList(delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    child: Text(stick.items[index]),
                  );
                },
            childCount: stick.items.length
        )),
      ));
    });
    return list;
  }

  List<_StickBody> dataList = [];

  _createDataList() {
    for(var i=1;i<=7;i++){
      var stickBody = _StickBody();
      for(var j =1; j<=20;j++){
        stickBody..items.add(j.toString());
      }
      dataList.add(stickBody..index = i);
    }
    setState(() {});
  }
}

class _StickBody {
  int index = 0;
  List<String> items = [];
}