import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusable_card.dart';


const bottomContainerHeight = 80.0;
const activeColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);
const inactiveColor = Color(0xFF111328);


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveColor;
  Color femaleCardColor = inactiveColor;
  void updateColor(int gender){

    if(gender == 1){
      if(maleCardColor == inactiveColor){
        maleCardColor = activeColor;
        femaleCardColor = inactiveColor;
      }else{
        maleCardColor = inactiveColor;
      }
    }
    if (gender == 2){
      if(femaleCardColor == inactiveColor){
        femaleCardColor = activeColor;
        maleCardColor = inactiveColor;
      }else{
        femaleCardColor = inactiveColor;
    }
  }}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CALCULATEUR IMC'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(child: GestureDetector(
                  onTap: (){
                    setState(() {
                      updateColor(1);
                    });
                  },
                  child: ReusableCard(
                    couleur: maleCardColor,
                    cardChild: IconContent(icon: FontAwesomeIcons.mars,texte: 'HOMME',)
                    ),
                ),
                ),
                Expanded(child: GestureDetector(
                  onTap: (){
                    setState(() {
                      updateColor(2);
                    });
                  },
                  child: ReusableCard(
                    couleur: femaleCardColor,
                    cardChild: IconContent(icon: FontAwesomeIcons.venus,texte: 'FEMME',)
                  ),
                )
                )],
            )),
            Expanded(child: ReusableCard(couleur: activeColor)),
            Expanded(
                child: Row(
              children: [
                Expanded(child: ReusableCard(couleur: activeColor)),
                Expanded(child: ReusableCard(couleur: activeColor))
              ],
            )),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top:10),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}



