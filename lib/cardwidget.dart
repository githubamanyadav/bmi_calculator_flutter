import 'package:flutter/material.dart';

import 'constant.dart';

class cardwidget extends StatelessWidget {
 
const cardwidget({required this.icon,required this.label});

final IconData icon;
final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
        icon,
          size: 80,
          
        ),
        SizedBox(
          height: 10,
        ),
        Text(
        label,
          style: labelTextstyle,
        )
      ],
    );
  }
}
