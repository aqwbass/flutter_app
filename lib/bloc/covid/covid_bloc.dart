import 'package:flutter/cupertino.dart';
import 'package:flutter_boc/models/covid/covid_today.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_boc/respository/covid/client.dart';
part 'covid_event.dart';
part 'covid_state.dart';
class CovidBloc extends Bloc<CovidEvent , CovidState>{
  final _repository = CovidClient() ;
  CovidBloc() : super(CovidInitial());

  @override
  Stream<CovidState> mapEventToState(CovidEvent event) async*{
    // TODO: implement mapEventToState
    if (event is FetchCovidData){
      yield CovidLoading();
      yield* _loadContent();
    }
  }
  Stream<CovidState> _loadContent() async*{

    try{
      final covid = await _repository.fetchCovid();
      yield CovidLoaded(today: covid) ;
    } catch (e, stack){
      yield CovidError(message: 'error') ;
    }
  }
  @override
  void onTransition(Transition<CovidEvent, CovidState> transition) {
    // TODO: implement onTransition
    print(transition);
    super.onTransition(transition);
  }


}
