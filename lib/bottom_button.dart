
import 'package:flutter/material.dart';
import 'constant.dart';

class bottombutton extends StatelessWidget {
  bottombutton({required this.onTap,required this.buttonTitle});

  final VoidCallback  onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     
          onTap:onTap,
        
         
     child: Container(
       
          child: Center(
            child: Text(buttonTitle,style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        
                          
                        ),),
          ),
       color: bottomcardcolour,
      
       height: 90,
     
     ),
          );
  }
}