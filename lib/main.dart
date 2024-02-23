
import 'package:flutter/material.dart';
import 'inputpage.dart';
void main() {
  runApp(const Bmicalc());
}

class Bmicalc extends StatelessWidget {
  const Bmicalc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Color(0xFF0A0D22)
        ),
        primaryColor: Color(0xFF090C21),
   colorScheme: ColorScheme.dark(
    primary:Colors.black,
    secondary: Colors.black,

   
   ),
 
       
        // textTheme:TextTheme(
        //  bodyMedium: (TextStyle(
        //   color: Colors.white,
        //  ))
        // )
       

        
   ),
 home: const Inputpage(),

    );
  }
}

