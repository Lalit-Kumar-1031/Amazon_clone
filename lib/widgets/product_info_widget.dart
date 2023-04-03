import 'package:amazon_clone/utils/colors_theme.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/cost_item_widget.dart';
import 'package:flutter/material.dart';

class ProductInfoWidget extends StatelessWidget {
  final String product_name;
  final double cost;
  final String sellername;
  const ProductInfoWidget(
      {Key? key,
      required this.product_name,
      required this.cost,
      required this.sellername})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screensize = Utils().getScreenSize();
    return SizedBox(
      width: screensize.width/2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            product_name,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0.5,
                overflow: TextOverflow.ellipsis),
            maxLines: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CostItemWidget(cost: cost, color:Colors.black),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(text: TextSpan(children: [
              TextSpan(text: "Sold by ",style: TextStyle(color:Colors.grey[700],fontSize: 13)),
              TextSpan(text: sellername,style: TextStyle(color: activeCyanColor,fontSize: 13)),
            ])),
          )
        ],
      ),
    );
  }
}
