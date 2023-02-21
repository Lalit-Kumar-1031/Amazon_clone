import 'dart:async';

import 'package:amazon_clone/Screens/SignInScreen.dart';
import 'package:amazon_clone/utils/constansts.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(const Duration(seconds: 4),(timer){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
    });

  }

  @override
  Widget build(BuildContext context) {
    Size screensize=Utils().getScreenSize();
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: screensize.height*0.2,
            width:screensize.width*0.6,
            child: Image.network(amazonLogo),
        ),
      ),
    );
  }
}
