import 'package:rxdart/rxdart.dart';

class HomeScreenBloc {
  BehaviorSubject<bool> _isTyping$;


  BehaviorSubject<bool> get isTyping$ => _isTyping$;
  
  HomeScreenBloc() {
    _isTyping$ = BehaviorSubject<bool>.seeded(false);
  }

  void changeTypingState(bool value) {
    _isTyping$.add(value);
  }

  void dispose() {
    _isTyping$.close();
  }
}
