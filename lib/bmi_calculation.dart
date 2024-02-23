
import 'dart:math';


class Bmicalculator
{
  Bmicalculator({required this.height, required this.weight});
 
  int height;
  int weight;
late double _bmi;
  String calculatorBMI(){
  _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25)
    {
      return 'over weight';
    }
    else if (_bmi>18.5)
    {
      return 'Normal';
    }
else{
  return 'Underweight';
}

  }
 String getinterp(){
    if(_bmi >= 25)
    {
      return 'you have to do exercise';
    }
    else if (_bmi>18.5)
    {
      return 'good! you are healthy:-)';
    }
else{
  return 'you have to eat bit more';
}
  }
}