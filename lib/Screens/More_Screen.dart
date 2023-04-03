import 'package:amazon_clone/utils/constansts.dart';
import 'package:amazon_clone/widgets/Search_Bar.dart';
import 'package:amazon_clone/widgets/more_category_widget.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(isReadOnly: true, hasBackButton: false),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.2 / 3.5,
                mainAxisSpacing:7,
                crossAxisSpacing: 7,
              ),
              itemCount: categoryLogos.length,
              itemBuilder: (context, index) {
                return MoreCategoryWidget(index: index);
              },),
        ),
      ),
    );
  }
}
