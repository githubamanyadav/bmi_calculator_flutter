import 'package:bmical/main.dart';
import 'package:bmical/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cardwidget.dart';
import 'reusableard.dart';
import 'bottom_button.dart';
import 'bmi_calculation.dart';
import 'constant.dart';

enum Gender { male, female }

class Inputpage extends StatefulWidget {
  const Inputpage({super.key});

  @override
  State<Inputpage> createState() => InputpageState();
}

class InputpageState extends State<Inputpage> {
  Gender? selectedGender;
  int Weight = 80;
  int Height = 180;
  int age =14;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0D22),
      appBar: AppBar(
        title: const Text('BMI calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: Reusablecard(
                      colour: selectedGender == Gender.male
                          ? activecardcolour
                          : inactivecolour,
                      cardchild: cardwidget(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: Reusablecard(
                      colour: selectedGender == Gender.female
                          ? activecardcolour
                          : inactivecolour,
                      cardchild: cardwidget(
                        icon: FontAwesomeIcons.venus,
                        label: 'Female',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            //height box
            child: Reusablecard(
              colour: activecardcolour,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                  
                    style: TextStyle(fontSize: 20,
                    color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(Height.toString(), style: Kmidtext),
                      Text('cm', style: labelTextstyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: Height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newvalue) {
                        setState(() {
                          Height = newvalue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusablecard(
                    colour: activecardcolour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: labelTextstyle,
                        ),
                        Text(
                          Weight.toString(),
                          style: TextStyle(
           color: Colors.white,
           fontSize: 40,
           fontWeight: FontWeight.w900,

                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  Weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.add,
                              onPressed: () {
                                setState(() {
                                  Weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(children: [
                    Expanded(child: Reusablecard(colour: activecardcolour, cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: labelTextstyle,
                        ),
                        Text(age.toString(),style:TextStyle(color: Colors.white,
                        fontSize: 30.0,),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.add, onPressed: (){
                              setState(() {
                                age++;
                              });
                            }
                            ),
                            SizedBox(width:10.0),
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                              setState(() {
                                age--;
                              });
                            })

                          ],
                        )
                      ],
                    )))
                  ],)
                ),
              ],
            ),
          ),
        
           bottombutton(buttonTitle: 'CALCULATE', onTap: (){

            Bmicalculator calc = Bmicalculator( height: Height, weight: Weight);
            String calculate = calc.calculatorBMI();
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(
             
               interpretation: calc.getinterp(),
               bmiResult: calculate,
              resulttext: calc.getResult(),
                
            )));
           } ,),
        ],
      ),
    );
  }
}



class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final VoidCallback onPressed;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 8.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
