import 'dart:math';
class Calculator{
  Calculator({this.height,this.weight});
  final int height;
  final int weight;
  double _bmi;
 String calculate(){
   _bmi= weight/pow(height/100,2);
   return  _bmi.toStringAsFixed(1);
 }

 String getResult(){
   if(_bmi>=25){
     return 'OVERWEIGHT';
   }
   else if(_bmi>18.5){
     return 'NORMAL';
   }
   else{
     return 'UNDERWEIGHT';
   }
 }
 String getinterpretation(){
   if(_bmi>=25){
     return 'High risk of developing heart disease, high blood pressure, stroke, diabetes';
   }
   else if(_bmi>18.5){
     return 'Low Risk Healthy range ';
   }
   else{
     return 'Risk of developing problems such as nutritional deficiency and osteoporosis';
   }
 }
}