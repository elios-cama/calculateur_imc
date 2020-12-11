
import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({this.weight,this.height});

  final int height;
  final int weight;

  double _bmi;
  String calculateBMI(){
    _bmi = weight/ pow(height/100,2);
     return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi >= 25){
      return 'Surpoids';
    }else if(_bmi > 18.5){
      return 'Normal';
    }else 'Maigre';
  }
  getInterpretation(){
    if(_bmi >= 25){
      return  'fais du sport batard';
    }else if(_bmi > 18.5){
    return 'On est la';
    }else 'Mange tes morts';
  }
}