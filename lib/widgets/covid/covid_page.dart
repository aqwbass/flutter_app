import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boc/bloc/covid/covid_bloc.dart';
import 'package:flutter_boc/shared/colors.dart';
import 'package:flutter_boc/widgets/covid/covid_stonks.dart';
import 'package:flutter_boc/widgets/covid/widgets/heading/covid_heading.dart';
import 'package:flutter_boc/widgets/widgets/empty_screen.dart';
import 'package:flutter_offline/flutter_offline.dart';


class CovidPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: OfflineBuilder(
        child: Container(),
        connectivityBuilder: (context , connectivity , child,){
          return connectivity == ConnectivityResult.none
          ? _buildNoConnectionMessage(context)
          : _buildContent(context);
      }
      )
    );
  }
  Widget _buildNoConnectionMessage(context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 14,
          left: 24,
          right: 24
      ),
      child: EmptyScreen(message: 'Looks like you don\'t have an internet connection.'),
    );
  }

  Widget _buildContent(context) {
    return RefreshIndicator(
        child: SafeArea(
          child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              children: [
                CovidHeadingSection(),
                CovidStonksSection(),
              ]
          ),
        ),
      onRefresh: ()async{
          BlocProvider
          .of<CovidBloc>(context)
              .add(FetchCovidData()) ;
      },
    );
  }

}