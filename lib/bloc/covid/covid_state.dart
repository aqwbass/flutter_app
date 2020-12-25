part of 'covid_bloc.dart';
@immutable
abstract class CovidState{}

class CovidInitial extends CovidState{}

class CovidError extends CovidState{
  final String message;
  CovidError({
    @required this.message
});
}
class CovidStockEmpty extends CovidState{
  final List<CovidTodayModel> today ;

  CovidStockEmpty({
   @required this.today
});
}

class CovidLoading extends CovidState{}

class CovidLoaded extends CovidState{
  final List<CovidTodayModel> today ;

  CovidLoaded({
    @required this.today
  });
}
