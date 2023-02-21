import 'package:amazon_clone/Screens/SplashScreen.dart';
import 'package:amazon_clone/utils/colors_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main()async{
    WidgetsFlutterBinding.ensureInitialized();

   await Firebase.initializeApp();
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
