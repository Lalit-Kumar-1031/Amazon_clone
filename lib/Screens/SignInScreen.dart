import 'package:amazon_clone/utils/constansts.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/CustomMainButton.dart';
import 'package:amazon_clone/widgets/Text_Field.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailcontroller=TextEditingController();
  final passwordController=TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screensize=Utils().getScreenSize();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
        child: Center(
          child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(amazonLogo,height: screensize.height*0.1,),
                Container(
                  height: screensize.height*0.6,
                  width: screensize.width*0.8,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 1),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sign In',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),),
                      TextFieldWidget(
                        title: "Email",
                        hintText: "Enter Email here",
                        controller: emailcontroller,
                        obscureText: false,
                      ),
                      TextFieldWidget(
                        title: "Password",
                        hintText: "Enter Passward here",
                        controller: passwordController,
                        obscureText: true,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomMainButton(
                            child:const  Text("Sign In",style: TextStyle(fontSize: 17),),
                            color: Colors.orange,
                            isLoading: false,
                            onPressed: (){}),
                      ),
                    ],
                  )
                ),
                CustomMainButton(
                    child:Text("Create an Amazon Account "),
                    color: Colors.grey[400]!,
                    isLoading: false,
                    onPressed: (){}),
              ],
            ),
        ),
      ),
    );
  }
}
