import 'package:bmi_calculator/components/Bottom.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/Input_page.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult, @required this.Interpretation, @required this.resultText});
  final  String bmiResult;
  final String resultText;
  final String Interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculateur de IMC'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            child: Text(
              'Ton résultat',
              style: kTitleTextStyle,
              textAlign: TextAlign.center,
            ),
            padding: EdgeInsets.only(top: 29),
          )),
          Expanded(
              flex: 5,
            child: ReusableCard(couleur: KActiveColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  resultText.toUpperCase(),
                  style: kResultTextStyle,
                  textAlign: TextAlign.center,
                ),
                Text(bmiResult,
                style: kBMITextStyle,),
                Text(Interpretation,
                style: kBodyTextStyle,
                  textAlign: TextAlign.center,)
              ],
            ),
            )
          ),
          Bottom(ButtonTitle: 'RE-CALCULER', onTap: (){
            Navigator.pop(context);
    })

        ],
      )
    );
  }
}
