import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CostItemWidget extends StatelessWidget {
  final Color color;
  final double cost;
  const CostItemWidget({Key? key,required this.cost,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text("₹ ",style: TextStyle(
          fontSize: 14,
          fontFeatures: [FontFeature.superscripts()]
        ),),

        Text(cost.toInt().toString(),style: TextStyle(fontSize:14,fontWeight: FontWeight.w600),),

        Text(" ${(cost-cost.toInt()).toString()}",style: TextStyle(
            fontSize: 8,
            fontFeatures: [FontFeature.superscripts()]
        ),),
        
      ],
    );
  }
}
