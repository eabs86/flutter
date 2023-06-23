import 'package:flutter/material.dart';

import '../shared/app_images.dart';

class ListViewHorizontalPage extends StatefulWidget {
  const ListViewHorizontalPage({super.key});

  @override
  State<ListViewHorizontalPage> createState() => _ListViewHorizontalPageState();
}

class _ListViewHorizontalPageState extends State<ListViewHorizontalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Column(
        children: [
          Expanded(
            flex:2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(elevation:8, child: Image.asset(AppImages.map1)),
                Card(elevation:8, child: Image.asset(AppImages.map2)),
                Card(elevation:8, child: Image.asset(AppImages.map3)),
              ],
            ),
          ),
          Expanded(
            flex:3,
            child: Container()),
        ],
      )
      );

  }
}