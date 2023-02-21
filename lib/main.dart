import 'package:amazon_clone/Screens/SplashScreen.dart';
import 'package:amazon_clone/utils/colors_theme.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const AmazonClone(),);
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Amazon Clone",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor:backgroundColor,
      ),
    home:const SplashScreen(),
    );
  }
}