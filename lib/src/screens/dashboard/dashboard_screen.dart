import 'package:flutter/material.dart';
import '../undercontruction/undercontruction.dart';
import '../../model/bottom_bar.dart';
import '../home/homePage.dart';
import './dashboard_bloc.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with TickerProviderStateMixin {
  DashBoardBloc _dashBoardBloc;
  GlobalKey<ScaffoldState> _scaffoldKey;
  List<BottomBarModel> _bottomBar;

  @override
  void initState() {
    _dashBoardBloc = DashBoardBloc();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _bottomBar = bottomBarItems;

    super.initState();
  }

  @override
  void dispose() {
    _dashBoardBloc.dispose();
    super.dispose();
  }

  List<Widget> _buildBarItem(
      List<BottomBarModel> list, int index, Function tabFunction) {
    List<Widget> itemList = [];

    for (int item = 0; item < list.length; item++) {
      bool isSelected = index == item;
      BottomBarModel barModel = list[item];
      itemList.add(InkWell(
        splashColor: Colors.transparent,
        onTap: () => tabFunction(item),
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
          duration: Duration(milliseconds: 600),
          decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              isSelected
                  ? Text("")
                  : Icon(
                      barModel.itemIcon,
                      color: Colors.grey,
                    ),
              AnimatedSize(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.elasticInOut,
                  vsync: this,
                  child: isSelected
                      ? Text(
                          barModel.title,
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(''))
            ],
          ),
        ),
      ));
    }

    return itemList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: StreamBuilder<int>(
            stream: _dashBoardBloc.pageIndex$,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              final int _index = snapshot.data;
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildBarItem(_bottomBar, _index,
                    (index) => _dashBoardBloc.updatePageIndex(index)),
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
                return HomePages();
                break;
              case 1:
                return UnderContruction();
                break;
              case 2:
                return UnderContruction();
                break;
              case 3:
                return UnderContruction();
                break;
              default:
                return HomePages();
            }
          },
        ),
      ),
    );
  }
}
