import 'dart:math';
import 'package:flutter/material.dart' hide Page;
import 'package:joinu_component/routes/dash_page_route.dart';
import 'package:joinu_component/routes/gradient_circular_progress.dart';
import 'package:joinu_component/routes/reorderable_listview_page.dart';
import 'package:joinu_component/routes/search_page.dart';
import 'package:joinu_component/routes/stick_list.dart';
import 'package:joinu_component/routes/swiper.dart';
import 'package:joinu_component/routes/watermark.dart';

import 'component/joinu_seek_bar.dart';
import 'flukit.dart';

import 'common/page_scaffold.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final routesMap= mapRoutes(getRoutes());
      final maxWidth = min(constraints.maxWidth, 500.0);
      return MaterialApp(
        title: 'JoinuComponet',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: routesMap,
        onGenerateRoute: (RouteSettings settings) {
          String routeName = settings.name!.substring(1).toLowerCase();
          routeName = Uri.decodeComponent(routeName);
          return MaterialPageRoute(
            builder: routesMap[routeName] ??
                    (context) => const MyHomePage(title: 'Flutter组件库'),
          );
        },
        home: const MyHomePage(title: 'Flutter组件库'),
      );
    });
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title , style: TextStyle(fontSize: 16),),
      actions: [
        IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx){
              return SearchPage();
            }),
          );
        }, icon: Icon(Icons.search))
      ],
      ),
      body: ListPage(
        children: getRoutes(),
      ),
    );
  }
}

List<Page> getRoutes(){
  return  [
    Page("seekBar",  SiteSeekBar(), showLog: true),
    Page("Swiper", const SwiperRoute()),
    Page("StickList", const StickList()),
    Page("GradientCircularProgressIndicator", const GradientCircularProgressRoute()),
    Page("waterMark", const WatermarkRoute()),
    Page("dash_widget",  DashRoute()),
    Page("recordableList",  ReorderableListPage()),
  ];
}



Map<String, WidgetBuilder> mapRoutes(List<Page> pages) {
  return pages.fold(<String, WidgetBuilder>{}, (pre, page) {
    pre[page.title.toLowerCase()] = page.build;
    return pre;
  });
}

