import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boc/bloc/couter/counter_bloc.dart';
import 'package:flutter_boc/bloc/covid/covid_bloc.dart';
import 'package:flutter_boc/bloc/fruad/fruad_bloc.dart';
import 'package:flutter_boc/bloc/portfolio/portfolio_bloc.dart';
import 'package:flutter_boc/models/fruad/fruad_model.dart';
import 'package:flutter_boc/widgets/counter/counter_page.dart';
import 'package:flutter_boc/widgets/home.dart';
import 'package:flutter_boc/models/fruad/fruads.dart';

void main() async {
//  Bloc.observer = SimpleBlocObserver() ;
//  CounterBloc c = new CounterBloc(0) ;
//  c.add(CounterEvent.increment) ;
//  c.close() ;

  WidgetsFlutterBinding.ensureInitialized();
  final jsonA = json.decode("{\"Fname\":\"A\",\"Lname\":\"Buaget\"}") ;
  final jsonB = json.decode("{\"Fname\":\"B\",\"Lname\":\"Buaget\"}") ;
  FruadModel f1 = FruadModel.fromJson(jsonA) ;
  FruadModel f2 = FruadModel.fromJson(jsonB) ;
  FrudsModel f = new FrudsModel([f1,f2]) ;
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
              create: (context) => CounterBloc(10),
          ),
          BlocProvider<FruadBloc>(
            create: (context) => FruadBloc(f),
          ),
          BlocProvider<PortfolioBloc>(
            create: (context) => PortfolioBloc(),
          ),
          BlocProvider<CovidBloc>(
            create: (context) => CovidBloc(),
          ),
        ],
      child: MaterialApp(
        title: 'couter',
        theme: ThemeData(brightness: Brightness.dark),
        home: MultipageApphomeState(),
      ),
    )
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