import 'package:rxdart/rxdart.dart';

class DashBoardBloc {
  BehaviorSubject<int> _pageIndex$;

  BehaviorSubject<int> get pageIndex$ => _pageIndex$;

  DashBoardBloc() {
    _pageIndex$ = BehaviorSubject<int>.seeded(0);
  }

  updatePageIndex(int index) {
    _pageIndex$.add(index);
  }

  void dispose() {
    _pageIndex$.close();
  }
}
