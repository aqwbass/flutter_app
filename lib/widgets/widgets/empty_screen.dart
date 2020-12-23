import 'package:flutter/cupertino.dart';
import 'package:flutter_boc/shared/colors.dart';

class EmptyScreen extends StatelessWidget {
  final String message;

  EmptyScreen({
    this.message
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      message,
      style: TextStyle(
        height: 1.5,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: kGray
      ),
      textAlign: TextAlign.start,
    );
  }}