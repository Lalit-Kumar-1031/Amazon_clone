import 'package:amazon_clone/Layouts/Screen_Layout.dart';
import 'package:amazon_clone/Screens/SignInScreen.dart';
import 'package:amazon_clone/Screens/SplashScreen.dart';
import 'package:amazon_clone/utils/colors_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/foundation.dart';
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
    home:StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot <User?> user) {
       if(user.connectionState==ConnectionState.waiting)
         {
           return const Center(child: CircularProgressIndicator(color: Colors.orange,));
         }
       else if(user.hasData) {
        return const ScreenLayout();
       }
       else{
         return const SignInScreen();
       }

      },
    ),
    );
  }
}
