import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_boc/models/portfolio/market_index.dart';
import 'package:flutter_boc/respository/portfolio/client.dart';
part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState>{

  final _repository = PortfolioClient();

  PortfolioBloc() : super(PortfolioInitial());

  @override
  Stream<PortfolioState> mapEventToState(PortfolioEvent event) async*{
    // TODO: implement mapEventToState
   if (event is FetchPortfolioDate){
     yield PortfolioLoading() ;
     yield* _loadContent() ;
   }
  }
  Stream<PortfolioState> _loadContent() async*{
    try{
      final indexes = await _repository.fetchIndexes();

      yield PortfolioStockEmpty(indexes: indexes) ;
    }catch(e, stack){
      yield PortfolioError(message: 'error') ;
    }
  }
  @override
  void onEvent(PortfolioEvent event) {
    // TODO: implement onEvent
    print(event);
    super.onEvent(event);
  }
}

