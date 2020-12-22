import 'package:bloc/bloc.dart';
import 'package:flutter_boc/models/fruad/fruad_model.dart';
import 'package:flutter_boc/models/fruad/fruads.dart';

enum FruadEvent{ show }

class FruadBloc extends Bloc<FruadEvent, FrudsModel>{
  FruadBloc(FrudsModel initialState) : super(initialState);

  @override
  Stream<FrudsModel> mapEventToState(FruadEvent event) async*{
    // TODO: implement mapEventToState
   switch(event) {
     case FruadEvent.show :
       yield state ;
       break ;
   }
  }
  @override
  void onEvent(FruadEvent event) {
    // TODO: implement onEvent
    print(event);
    super.onEvent(event);
  }
  @override
  void onTransition(Transition<FruadEvent, FrudsModel> transition) {
    // TODO: implement onTransition
    print(transition) ;
    super.onTransition(transition);
  }
  @override
  void onChange(Change<FrudsModel> change) {
    // TODO: implement onChange
    print(change) ;
    super.onChange(change);
  }
}
