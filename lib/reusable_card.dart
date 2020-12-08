
import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard ({ @required this.couleur, this.cardChild, this.OnPress});
  final Color couleur ;
  final Widget cardChild;
  final Function OnPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: couleur,
            borderRadius: BorderRadius.circular(10.0)),
        child: cardChild,
      ),
    );
  }
}
