import 'dart:math';

class BmiCalculateModel{

  BmiCalculateModel({required this.height,required this.weight});

  final int height;
  final int weight;
  double _bmi=0;

  double calculateBMI(){
    _bmi=weight/pow(height/100,2);
    return _bmi;
  }

  String getResult(){

    if(_bmi>=25){
      return 'OverWeight';
    }else if(_bmi>18.5){
      return 'Normal';
    }else{
      return 'underWeight';
    }
  }

  String getMessage(){

    if(_bmi>=25){
      return 'You have a higher than normal body weight.Try to exersice more!!';
    }else if(_bmi>18.5){
      return 'You have a normal body weight. Good job!';
    }else{
      return 'You have a lower than normal body weight. You can eat a bit more!!';
    }
  }


}