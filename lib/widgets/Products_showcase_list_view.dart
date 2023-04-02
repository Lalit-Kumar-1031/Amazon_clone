import 'package:amazon_clone/utils/colors_theme.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductShowCaseListView extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ProductShowCaseListView(
      {Key? key, required this.title, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screensize = Utils().getScreenSize();
    double height = screensize.height * 0.25;
    double titleHeight = 25;
    return Container(
      height: height,
      margin: EdgeInsets.all(10),
      width: screensize.width,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: titleHeight,
            child: Row(
              children: [
                SizedBox(
                  width: 14,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  " show more ",
                  style: TextStyle(color: activeCyanColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height - titleHeight - 5,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
