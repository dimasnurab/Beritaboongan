import 'package:beritaboong/screens/beritadetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sailor/sailor.dart';
import './providers/berita.dart';
import './providers/categoryBerita.dart';
import './screens/berita.dart';
import './screens/searchPage.dart';
import './screens/splashScreen.dart';

void main() {
  Routes.createRoutes();
  runApp(BeritaBoongApp());
}

class BeritaBoongApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Beritas(),
        ),
        ChangeNotifierProvider.value(
          value: CategoryBeritas(),
        )
      ],
      child: MaterialApp(
        navigatorKey: Routes.sailor.navigatorKey,
        onGenerateRoute: Routes.sailor.generator(),
        title: 'Test Exaditama',
        home: SplashScreen(),
      ),
    );
  }
}

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoutes([
      SailorRoute(
          builder:
              (BuildContext context, BaseArguments args, ParamMap paramMap) {
            return SplashScreen();
          },
          name: 'splash'),
      SailorRoute(
        builder: (BuildContext context, BaseArguments args, ParamMap paramMap) {
          return BeritaPage();
        },
        name: 'beritapage',
        defaultTransitions: [SailorTransition.fade_in],
      ),
      SailorRoute(
        builder: (BuildContext context, BaseArguments args, ParamMap paramMap) {
          return SearchPage();
        },
        name: 'search',
        defaultTransitions: [SailorTransition.fade_in],
      ),
    ]);
  }
}
