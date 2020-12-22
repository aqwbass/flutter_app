import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boc/counter_bloc.dart';
import 'package:flutter_boc/counter_page.dart';

void main() async {
//  Bloc.observer = SimpleBlocObserver() ;
//  CounterBloc c = new CounterBloc(0) ;
//  c.add(CounterEvent.increment) ;
//  c.close() ;

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(10),
      child: MaterialApp(
        title: 'couter',
        theme: ThemeData(brightness: Brightness.dark),
        home: CounterPage(),
      ),
    ),
  );
}
//enum CounterEvent { increment }
//class CounterBloc extends Bloc<CounterEvent , int> {
//  CounterBloc(int initialState) : super(initialState);
//
//  @override
//  Stream<int> mapEventToState(CounterEvent event) async*{
//    // TODO: implement mapEventToState
//    switch (event) {
//      case CounterEvent.increment :
//        yield state + 1;
//        break ;
//    }
//  }
//  @override
//  void onEvent(CounterEvent event) {
//    // TODO: implement onEvent
//    print(event) ;
//    super.onEvent(event);
//  }
//  @override
//  void onChange(Change<int> change) {
//    // TODO: implement onChange
//   print(change);
//   super.onChange(change) ;
//  }
//
//  @override
//  void onTransition(Transition<CounterEvent, int> transition) {
//    // TODO: implement onTransition
//    print(transition) ;
//    super.onTransition(transition);
//  }
//}
//class SimpleBlocObserver extends BlocObserver{
//  @override
//  void onEvent(Bloc bloc, Object event) {
//    // TODO: implement onEvent
//    print('${bloc.runtimeType} , $event') ;
//    super.onEvent(bloc, event);
//  }
//  @override
//  void onChange(Cubit cubit, Change change) {
//    // TODO: implement onChange
//    print('${cubit.runtimeType} , $change') ;
//    super.onChange(cubit, change);
//  }
//  @override
//  void onTransition(Bloc bloc, Transition transition) {
//    // TODO: implement onTransition
//    print('${bloc.runtimeType} ,$transition');
//    super.onTransition(bloc, transition);
//  }
//  @override
//  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
//    // TODO: implement onError
//    print('${cubit.runtimeType}, $error , $stackTrace') ;
//    super.onError(cubit, error, stackTrace);
//  }
//}