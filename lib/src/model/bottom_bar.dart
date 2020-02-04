import 'package:flutter/material.dart';

class BottomBarModel {
  String title;
  IconData itemIcon;

  BottomBarModel({this.title, this.itemIcon});
}

List<BottomBarModel> get bottomBarItems => _bottomBarItems;

List<BottomBarModel> _bottomBarItems = [
  BottomBarModel(title: 'HOME', itemIcon: Icons.home),
  BottomBarModel(title: 'PENCARIAN', itemIcon: Icons.search),
  BottomBarModel(title: 'NOTIFICATION', itemIcon: Icons.notifications),
  BottomBarModel(title: 'BOOKMARKS', itemIcon: Icons.bookmark),
];
