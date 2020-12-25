import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boc/bloc/covid/covid_bloc.dart';
import 'package:flutter_boc/models/covid/covid_today.dart';
import 'package:flutter_boc/widgets/widgets/empty_screen.dart';
import 'package:flutter_boc/widgets/covid/widgets/content/covid_stonk.dart';
import 'package:flutter_boc/widgets/widgets/loading_indicator.dart';
class CovidStonksSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<CovidBloc , CovidState>(
        // ignore: missing_return
        builder:  (BuildContext context, CovidState state){
          if (state is CovidInitial) {
            BlocProvider
            .of<CovidBloc>(context)
                .add(FetchCovidData());
          }
          if(state is CovidError){
            return Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height /3),
              child: EmptyScreen(message: state.message,),
            );
          }
          if(state is CovidLoaded) {
            return Column(
              children: <Widget>[
                _buildStockSection(covids: state.today,context: context),
              ],
            );
          }

          return Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height /3),
            child: LoadingIndicatorWidget(),
          );
        }
    );
  }
  Widget _buildStockSection({List<CovidTodayModel> covids, BuildContext context}) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: Colors.pinkAccent,
      child: CovidStockContainer(data: covids[0]),
    ) ;
}
}