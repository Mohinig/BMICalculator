import 'package:flutter/material.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult,this.resultText,this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'),),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(
            child: Text('Your Result',
             style: TextStyle(
                        color:Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),),
          )),
          Expanded(
            flex:5,
            child:Resusablecard(colour:Color(0xFF1D1E33),
            cardChild: Column(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget>[
                Text(resultText,
                style: TextStyle(color:Color(0xFF24D876),
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
                ),
                Text(
                  bmiResult,
                  style:TextStyle(
                    fontSize: 100.0,
                    fontWeight: FontWeight.bold,
                  )
                ),
                Text(interpretation,
                textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize:22.0,
                 ),
                )
              ],
            ),) ),
             GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>InputPage()));
                },
                  child: Container(
                  color:Color(0xFFEB1555),
                  margin:EdgeInsets.only(top:10.0),
                  width:double.infinity,
                  height:80.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('RECALCULATE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 30.0,
                      ),
                      ),
                    ],
                  ),
                  ),
              )
        ],
      ),
    );
  }
}