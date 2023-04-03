import 'package:amazon_clone/Models/Product_Model.dart';
import 'package:amazon_clone/utils/colors_theme.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/Custom_Rounded_Button.dart';
import 'package:amazon_clone/widgets/Custom_Square_Button.dart';
import 'package:amazon_clone/widgets/product_info_widget.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatefulWidget {
  ProductModel productModel;
  CartItemWidget({Key? key,required this.productModel}) : super(key: key);

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {

  int items=0;
  @override
  Widget build(BuildContext context) {
    Size screensize = Utils().getScreenSize();
    print(items);
    return Container(
      height: screensize.height / 2,
      width: screensize.width,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screensize.width / 3,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.network(widget.productModel.url)),
                ),
                ProductInfoWidget(
                    product_name:widget.productModel.productName,
                    cost: widget.productModel.cost,
                    sellername: widget.productModel.sellerName)
              ],
            ),
            flex: 3,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  CustomSquareButtom(
                      child: Icon(Icons.remove),
                      color: backgroundColor,
                      onpressed: () {
                        setState(() {
                          if(items>0)
                            {
                              items--;
                            }
                        });
                      },
                      dimension: 40),
                  CustomSquareButtom(
                      child: Center(
                          child: Text(
                        "$items",
                        style: TextStyle(color: activeCyanColor),
                      )),
                      color: Colors.white,
                      onpressed: () {},
                      dimension: 40),
                  CustomSquareButtom(
                      child: Icon(Icons.add),
                      color: backgroundColor,
                      onpressed: () {
                        setState(() {
                          items++;
                        });
                      },
                      dimension: 40),
                ],
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,top: 13),
                  child: Row(
                    children: [
                      CustomRoundedButtom(text: "Delete",onpressed:(){},),
                      SizedBox(width: 10,),
                      CustomRoundedButtom(text: "Save for Later",onpressed:(){},),
                    ],
                  ),
                ),
                SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Align(child: Text("Show More About Product",style: TextStyle(color: activeCyanColor),),alignment: Alignment.centerLeft,),
                ),
              ],
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
