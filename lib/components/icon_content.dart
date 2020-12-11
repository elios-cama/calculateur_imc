import 'package:flutter/material.dart';

import '../constants.dart';


class IconContent extends StatelessWidget {
  IconContent({@required this.icon, @required this.texte});

  final IconData icon;
  final String texte;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text('$texte', style: KLabelTextStyle)
      ],
    );
  }
}