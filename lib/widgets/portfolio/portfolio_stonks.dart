import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boc/bloc/portfolio/portfolio_bloc.dart';
import 'package:flutter_boc/models/portfolio/market_index.dart';
import 'package:flutter_boc/widgets/portfolio/widgets/content/portfolio_index.dart';
import 'package:flutter_boc/widgets/widgets/empty_screen.dart';
import 'package:flutter_boc/widgets/widgets/loading_indicator.dart';

class PortfolioStonksSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<PortfolioBloc , PortfolioState>(
      // ignore: missing_return
      builder: (BuildContext context, PortfolioState state){
        if(state is PortfolioInitial){
          BlocProvider
          .of<PortfolioBloc>(context)
              .add(FetchPortfolioDate());
        }
        if(state is PortfolioError){
          return Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
            child: EmptyScreen(message: state.message,),
          );
        }
        if (state is PortfolioStockEmpty) {
          return Column(
            children: <Widget>[
              _buildIndexesSection(indexes: state.indexes),

              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 5,
                    horizontal: 4
                ),
                child: EmptyScreen(message: 'Looks like you don\'t have any holdings in your watchlist.'),
              ),
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


  Widget _buildIndexesSection({List<MarketIndexModel> indexes}) {
    return Container(
      height: 75,
      margin: EdgeInsets.only(top: 16, bottom: 16),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          scrollDirection: Axis.horizontal,
          itemCount: indexes.length,
          itemBuilder: (BuildContext context, int index) {
            return PortfolioIndexWidget(index: indexes[index]);
          }
      ),
    );
  }
}


