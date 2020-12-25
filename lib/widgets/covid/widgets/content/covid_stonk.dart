import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boc/models/covid/covid_today.dart';
import 'package:flutter_boc/shared/colors.dart';

class CovidStockContainer extends StatelessWidget {
  final CovidTodayModel data;

  const CovidStockContainer({
    @required this.data
  });

  static const _kNameStyle = const TextStyle(
      fontSize: 16,
    height: 1.5
  );

  static const _kAmount = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    height: 1.5
  );

  static const _kNewAmount = const TextStyle(
    fontSize: 14,
    height: 1.5
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Text('ติดเชื้อสะสม\n\n',style: _kNameStyle,maxLines: 1,),
        Text('${data.confirmed}\n\n',style: _kAmount,maxLines: 1,),
        Text('[+ ${data.newconfirmed}]',style: _kNewAmount,)
      ],
    );
  }
}