import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/result.dart';
import 'package:bmicalculator/calculate.dart';
const activeCardColor=Color(0xFF1D1E33);
const inactiveCardColor=Color(0xFF111328);
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor=inactiveCardColor;
  Color femaleCardColor=inactiveCardColor;
  int height=180;
  int weight=50;
  int age=18;
  void updateColour(int gender){
    if(gender==1){
      if(maleCardColor==inactiveCardColor){
        maleCardColor=activeCardColor;
        femaleCardColor=inactiveCardColor;
      }
      else{
        maleCardColor=inactiveCardColor;
      }
    }
    if(gender==2){
      if(femaleCardColor==inactiveCardColor){
        femaleCardColor=activeCardColor;
        maleCardColor=inactiveCardColor;
      }
      else{
        femaleCardColor=inactiveCardColor;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            updateColour(1);
                          });
                        },
                      child: Resusablecard(
                          colour:maleCardColor,
                          cardChild:Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children:<Widget>[
                            Icon(FontAwesomeIcons.mars,
                           size:80.0,),
                           SizedBox(height:15.0),
                           Text('MALE',style:TextStyle(fontSize:18.0,color:Color(0xFF8D8E98)),),
                          ],
                        ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            updateColour(2);
                          });
                        },
                       child: Resusablecard(colour:femaleCardColor,
                        cardChild:Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children:<Widget>[
                            Icon(FontAwesomeIcons.venus,
                           size:80.0,),
                           SizedBox(height:15.0),
                           Text('FEMALE',style:TextStyle(fontSize:18.0,color:Color(0xFF8D8E98)),),
                          ],
                        ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child:  Resusablecard(colour:activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text('HEIGHT',style:TextStyle(fontSize:18.0,color:Color(0xFF8D8E98)),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(),
                        style: TextStyle(
                          fontSize:50.0,
                          fontWeight:FontWeight.w900, ),),
                          Text(
                         'cm',
                         style:TextStyle(fontSize:18.0,color:Color(0xFF8D8E98)),
                       )
                      ],),
                      Slider(
                        value:height.toDouble(),
                        min:120.0,
                        max:220.0,
                        onChanged: (double newValue){
                          setState(() {
                            height=newValue.round();
                          }); 
                        },
                        activeColor:Color(0xFFEB1555),
                        inactiveColor:Color(0xFF8D8E98) ,),
                  ]
                ),
                ),
              ),
              Expanded(
               child:Row(
                children: <Widget>[
                Expanded(
                    child: Resusablecard(colour:activeCardColor,
                    cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text('WEIGHT',style:TextStyle(fontSize:18.0,color:Color(0xFF8D8E98)),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(weight.toString(),
                        style: TextStyle(
                          fontSize:50.0,
                          fontWeight:FontWeight.w900, ),),
                          Text(
                         'kg',
                         style:TextStyle(fontSize:18.0,color:Color(0xFF8D8E98)),
                       )
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                           onPressed: (){
                       setState(() {
                         weight++;
                       });
                     },),
                          SizedBox(
                        width:10.0,
                      ),
                    RoundIconButton(icon: FontAwesomeIcons.minus,
                     onPressed: (){
                       setState(() {
                         weight--;
                       });
                     },),
                        ],
                      ), 
                  ]
                ),
                     ),
                    ),
                 Expanded(
                    child: Resusablecard(colour:activeCardColor,
                    cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text('AGE',style:TextStyle(fontSize:18.0,color:Color(0xFF8D8E98)),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(age.toString(),
                        style: TextStyle(
                          fontSize:50.0,
                          fontWeight:FontWeight.w900, ),)    
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                           onPressed: (){
                       setState(() {
                         age++;
                       });
                     },),
                          SizedBox(
                        width:10.0,
                      ),
                     RoundIconButton(icon: FontAwesomeIcons.minus,
                     onPressed: (){
                       setState(() {
                         age--;
                       });
                     },),
                        ],
                      ), 
                  ]
                ),
                    ),
                    ),
                ],
              ),),
              GestureDetector(
                onTap: (){
                  Calculator cal=Calculator(height:height,weight:weight);
    
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                    bmiResult: cal.calculate(),
                    resultText:cal.getResult() ,
                    interpretation: cal.getinterpretation(),
                  )));
                },
                  child: Container(
                  color:Color(0xFFEB1555),
                  margin:EdgeInsets.only(top:10.0),
                  width:double.infinity,
                  height:80.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('CALCULATE',
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

class Resusablecard extends StatelessWidget {
  Resusablecard({@required this.colour,this.cardChild});
  final Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:cardChild,
      decoration: BoxDecoration(
          color:colour,
          borderRadius: BorderRadius.circular(10.0)),
      margin:EdgeInsets.all(10.0),
    );
  }
}

 class RoundIconButton extends StatelessWidget {
   RoundIconButton({@required this.icon,this.onPressed});
   final IconData icon;
   final Function onPressed;
   @override
   Widget build(BuildContext context) {
     return RawMaterialButton(
       child:Icon(icon),
       onPressed: onPressed,
       constraints: BoxConstraints.tightFor(
         width:56.0,
         height:56.0,
      ),
       shape: CircleBorder(),
       fillColor: Color(0xFF4C4F5E),
     );
   }
 }