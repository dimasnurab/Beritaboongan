import 'package:beritaboong/src/screens/home/home_screen.dart';
import 'package:beritaboong/src/screens/undercontruction/undercontruction.dart';
import 'package:flutter/material.dart';
import './dashboard_bloc.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  DashBoardBloc _dashBoardBloc;
  GlobalKey<ScaffoldState> _scaffoldKey;
  List<String> _titles;

  @override
  void initState() {
    _dashBoardBloc = DashBoardBloc();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _titles = ['Home', 'Bookmarks', 'Notification'];
    super.initState();
  }

  @override
  void dispose() {
    _dashBoardBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1.0,
                color: Colors.white,
              ),
            ),
          ),
          child: StreamBuilder<int>(
            stream: _dashBoardBloc.pageIndex$,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              final int _index = snapshot.data;
              return BottomNavigationBar(
                onTap: (int index) => _dashBoardBloc.updatePageIndex(index),
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 12.0,
                unselectedFontSize: 10,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                iconSize: 24,
                currentIndex: _index,
                elevation: 2,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    title: Text(_titles[0]),
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    title: Text(_titles[1]),
                    icon: Icon(Icons.bookmark),
                  ),
                  BottomNavigationBarItem(
                    title: Text(_titles[2]),
                    icon: Icon(Icons.notifications),
                  ),
                ],
              );
            },
          ),
        ),
        body: StreamBuilder<int>(
          stream: _dashBoardBloc.pageIndex$,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            final int _index = snapshot.data;
            switch (_index) {
              case 0:
                return HomeScreen();
                break;
              case 1:
                return UnderContruction();
                break;
              case 2:
                return UnderContruction();
                break;
              default:
                return HomeScreen();
            }
          },
        ),
      ),
    );
  }
}
