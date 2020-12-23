import 'package:flutter/cupertino.dart';
import 'package:flutter_boc/widgets/widgets/standard/header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class PortfolioHeadingSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final String formattedDate = DateFormat('MMMd').format((DateTime.now())) ;
    return StandardHeader(
        title: 'Portfolio',
        subtital: formattedDate,
        action: GestureDetector(
          child: Icon(FontAwesomeIcons.user),
        ),
    );
  }

}