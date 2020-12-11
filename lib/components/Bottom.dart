import 'package:flutter/material.dart';
import '../constants.dart';

class Bottom extends StatelessWidget {
  Bottom({@required this.ButtonTitle,@required this.onTap});
  final Function onTap;
  final String ButtonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Container(
          padding: EdgeInsets.only(bottom: 20),
          margin: EdgeInsets.only(top: 10),
          child: Center(
            child: Text(ButtonTitle,
              style: kLargeButtonStyle,
            ),
          ),
        ),
        color: KBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}