
import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard ({ @required this.couleur, this.cardChild});
  final Color couleur ;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: couleur,
          borderRadius: BorderRadius.circular(10.0)),
      child: cardChild,
    );
  }
}
