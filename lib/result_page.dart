import 'package:bmical/constant.dart';
import 'package:bmical/inputpage.dart';
import 'package:bmical/reusableard.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';
import 'inputpage.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.interpretation,required this.bmiResult, required this.resulttext});

 final String bmiResult;
final String resulttext;
final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0D22),
        appBar: AppBar(
          title: Text('BMI Calculator',textAlign: TextAlign.center,),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              
                child: Container(
                  padding: EdgeInsets.only(top: 30),
              child: Text(
                'Your Result',textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            )),
            Expanded(flex: 5,child: Reusablecard(colour: Color(0XFF1D1F33),cardchild:Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
          Text(resulttext,style: TextStyle(color: Colors.green,
          fontSize: 30,),),

          Text(bmiResult,style: TextStyle(color: Colors.white,
          fontSize: 90,fontWeight: FontWeight.bold),),

             Text(interpretation,textAlign: TextAlign.center, style: TextStyle(color: Colors.white,
          fontSize: 20,fontWeight: FontWeight.bold,),)
         ],
         


            )),),
            bottombutton(onTap: (){
               Navigator.pop(context);
            }, buttonTitle: 'RE-CALCULATE')
          ],
        ));
  }
}
