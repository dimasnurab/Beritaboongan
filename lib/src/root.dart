import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './blocs/global.dart';
import './screens/dashboard/dashboard_screen.dart';

class BeritaBoongApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Provider(
      create: (BuildContext context) => GlobalBloc(),
      dispose: (BuildContext context, GlobalBloc bloc) => bloc.dispose(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DashBoard(),
      ),
    );
  }
}
