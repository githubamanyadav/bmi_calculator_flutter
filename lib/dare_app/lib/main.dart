

import 'package:flutter/material.dart';
 import 'package:rflutter_alert/rflutter_alert.dart';
void main() {
  runApp( Dare());
}

class Dare extends StatelessWidget {
   Dare({super.key});

 




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
        
          title: const Text('Dare App'),
          backgroundColor: Colors.grey.shade700,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Darepage(),
          ),
        ),
      ),
    );
  }
}

class Darepage extends StatefulWidget {
   Darepage({super.key});


  @override
  State<Darepage> createState() => _DarepageState();
} 


class _DarepageState extends State<Darepage> {


   List<Icon> rightbox= [ ];
   List<String> question =[
    ' HTML is a programming language used for creating web pages.',
'Bluetooth technology uses radio waves to connect devices wirelessly.'
     ,'The Windows operating system is developed by Apple Inc.',
     'The acronym "PDF" stands for "Portable Document Format.',
     'Google was founded before the year 2000.',
     'The Windows operating system is developed by Apple Inc.','The Windows operating system is developed by Apple Inc.','The Windows operating system is developed by Apple Inc.',
 ];
 List<bool> chekcans = [true,true,false,true,true,true , true ,true,];
    int quest = 0;
    int i = 0 ;
  void _checkans (bool chk)
  {
    if(chekcans[i]==chk){
        
                setState(() {
                   rightbox.add(Icon(Icons.check,color: Colors.green,),);
                 
                  i++;
                });
               
             
    }
    else if (chekcans[8]==null)
    {
      print(chekcans.last);
      Alert(
      context: context,
      type: AlertType.error,
      title: "Great!",
      desc: "you have completed",
      buttons: [
        DialogButton(
          child: Text(
            "COOL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
    }
    else {
     
                  setState(() {
                    rightbox.add(Icon(Icons.close,color: Colors.red,));
                   
                    i++;
                  });
 
        
             
    }
      
      
    }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
            question[quest],
            
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            width: 300,
            height: 100,
            child: ElevatedButton(
              onPressed: () {
                _checkans(true);
                quest++;
              },
           
              child: Text("True"),
    
              style: ElevatedButton.styleFrom(
                
              
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.green,
                //  padding: EdgeInsets.symmetric(horizontal: 300, vertical: 20),
                textStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            width: 300,
            height: 100,
            child: ElevatedButton(
                child: Text('False'),
                onPressed: () {
                  _checkans(false);
                  quest++;
                  
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.red,
                )),
          ),
        ),
        SizedBox(
          height: 200,
        ),
Row(


 children:rightbox,

),


    
      
      ]  
    );
  }
}
