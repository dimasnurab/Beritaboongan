import 'package:flutter/material.dart';

class TabBarModel {
  String titleTab;
  Color color;
  IconData iconData;

  TabBarModel({this.titleTab, this.color, this.iconData});
}

List<TabBarModel> tabBarMode = [
  TabBarModel(titleTab: 'Business', color: Colors.blue),
  TabBarModel(titleTab: 'Sports', color: Colors.blueGrey),
  TabBarModel(titleTab: 'Technology', color: Colors.teal),
  TabBarModel(titleTab: 'Entertainment', color: Colors.pink),
  TabBarModel(titleTab: 'Health', color: Colors.lightGreen),
  TabBarModel(titleTab: 'Science', color: Colors.blueAccent),
];
