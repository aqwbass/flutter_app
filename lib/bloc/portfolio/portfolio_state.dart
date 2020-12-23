part of 'portfolio_bloc.dart';

@immutable
abstract class PortfolioState {}

class PortfolioInitial extends PortfolioState {}

class PortfolioError extends PortfolioState{
  final String message;

  PortfolioError({
    @required this.message
});
}

class PortfolioStockEmpty extends PortfolioState{
  final List<MarketIndexModel> indexes ;

  PortfolioStockEmpty({
    @required this.indexes,
});

}

class PortfolioLoading extends PortfolioState{}

