import 'package:bloc/bloc.dart';

enum CounterEvent  { increment , decrement }

class CounterBloc extends Bloc<CounterEvent , int>{
  CounterBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    // TODO: implement mapEventToState
    switch (event) {
      case CounterEvent.increment :
        yield state +1 ;
        break ;
      case CounterEvent.decrement :
        yield state-1 ;
        break ;
    }
  }
  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    print(change) ;
    super.onChange(change);
  }
  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    // TODO: implement onTransition
    print(transition) ;
    super.onTransition(transition);
  }
  @override
  void onEvent(CounterEvent event) {
    // TODO: implement onEvent
    print(event);
    super.onEvent(event);
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    print(error) ;
    super.onError(error, stackTrace);
  }
}