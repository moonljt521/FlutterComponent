

import 'package:flutter/material.dart';

class ReorderableListPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ReorderableListPage> {

  List<String> items = List.generate(20, (int i) => '$i');

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      children: items.map((e) {
        return Container(
          key: ValueKey(e),
          height: 100,
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          decoration: BoxDecoration(
              color:
              Colors.primaries[int.parse(e) % Colors.primaries.length],
              borderRadius: BorderRadius.circular(10)),
        );
      }).toList(),

      onReorder: (int oldIndex, int newIndex) async {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        var child = items.removeAt(oldIndex);
        items.insert(newIndex, child);
        setState(() {});


      },);
  }

}