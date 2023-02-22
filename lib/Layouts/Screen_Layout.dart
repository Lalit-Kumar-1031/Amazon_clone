import 'package:amazon_clone/utils/colors_theme.dart';
import 'package:amazon_clone/utils/constansts.dart';
import 'package:flutter/material.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({Key? key}) : super(key: key);

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  PageController pageController=PageController();
  int currentPage=0;
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  changepage(int page){
  pageController.jumpToPage(page);
  setState(() {
  currentPage=page;
  });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children:screens,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(
              width: 1,color: Colors.grey[500]!,
            ))
          ),
          child: TabBar(
            indicator: BoxDecoration(
              border: Border(
                top: BorderSide(color:activeCyanColor,width: 4),
              )
            ),
            indicatorSize: TabBarIndicatorSize.label,
            onTap:changepage ,
            tabs: [
              Tab(icon: Icon(Icons.home_outlined,color: currentPage==0?activeCyanColor:Colors.black,),),
              Tab(icon: Icon(Icons.account_circle_outlined,color: currentPage==1?activeCyanColor:Colors.black,),),
              Tab(icon: Icon(Icons.shopping_cart_outlined,color: currentPage==2?activeCyanColor:Colors.black,),),
              Tab(icon: Icon(Icons.menu,color: currentPage==3?activeCyanColor:Colors.black),),

            ],

          ),
        ),
      ),
    );
  }
}
