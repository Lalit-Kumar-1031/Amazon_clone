import 'package:amazon_clone/utils/constansts.dart';
import 'package:flutter/material.dart';

class HorizontalCategoryListView extends StatefulWidget {
  const HorizontalCategoryListView({Key? key}) : super(key: key);

  @override
  State<HorizontalCategoryListView> createState() => _HorizontalCategoryListViewState();
}

class _HorizontalCategoryListViewState extends State<HorizontalCategoryListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:kAppBarHeight,
      width: double.infinity,
      color: Colors.white,
      child: ListView.builder(
        itemCount: categoriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
            child: Column(
              children: [
              CircleAvatar(
                backgroundImage: NetworkImage(categoryLogos[index]),
              ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Text(categoriesList[index]),
                ),
              ],
            ),
          ),
        );
      },),
    );
  }
}
