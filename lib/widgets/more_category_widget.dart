import 'package:amazon_clone/utils/constansts.dart';
import 'package:flutter/material.dart';

class MoreCategoryWidget extends StatelessWidget {
  final int index;
  const MoreCategoryWidget({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.4),blurRadius: 8,spreadRadius: 1,
          )]
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(categoryLogos[index]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(categoriesList[index]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
