
import 'package:flutter/material.dart' hide Page;

import 'package:joinu_component/component/icon_search_input_field.dart';

import '../common/page_scaffold.dart';
import '../main.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  FocusNode focusNode = FocusNode();

  TextEditingController searchJobEditingController = TextEditingController();
  
  List<Page> mPages = [];

  @override
  void initState() {
    super.initState();
    focusNode.unfocus();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("搜组件" , style: TextStyle(fontSize: 16),)),
      body: Column(
        children: [
          SearchInputField(
            hintText: '搜索组件',
            focusNode: focusNode,
            onChanged: (e) {
              _onChanged(e);
            },
            textFieldContainer: searchJobEditingController,
            clearInput: () {
              _onChanged('');
            },
          ),
          
          Expanded(child: ListPage(
            children: mPages,
          ))
        ],
      ),
    );
  }
  
  _onChanged(String? v) {
    if(v == '' || v == null) {
      searchJobEditingController.clear();
      focusNode.unfocus();
      setState(() {
        mPages = [];
      });
    }else {
      var pages = getRoutes();
      var r = pages.where((e) => e.title.toLowerCase().contains(v.toLowerCase())).toList();
      setState(() {
        mPages = r;
      });
    }
  }
  
  
}


