import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/Bottom.dart';
import '../components/roundIconButton.dart';
import 'package:bmi_calculator/calcultor_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CALCULATEUR IMC'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      OnPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      couleur: selectedGender == Gender.male
                          ? KActiveColor
                          : KInactiveColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        texte: 'HOMME',
                      )),
                ),
                Expanded(
                    child: ReusableCard(
                        OnPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        couleur: selectedGender == Gender.female
                            ? KActiveColor
                            : KInactiveColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          texte: 'FEMME',
                        )))
              ],
            )),
            Expanded(
                child: ReusableCard(
              couleur: KActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TAILLE',
                    style: KLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle2,
                      ),
                      Text(
                        'cm',
                        style: KLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    couleur: KActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: KLabelTextStyle),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    couleur: KActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: KLabelTextStyle),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            Bottom(
              ButtonTitle: 'CALCULER',
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      Interpretation: calc.getInterpretation(),
                    )));
              },
            )
          ],
        ));
  }
}
