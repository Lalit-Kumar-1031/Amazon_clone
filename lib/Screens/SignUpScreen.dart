import 'dart:math';

import 'package:amazon_clone/Resources/AuthenticationMethod.dart';
import 'package:amazon_clone/Screens/SignInScreen.dart';
import 'package:amazon_clone/utils/constansts.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/CustomMainButton.dart';
import 'package:amazon_clone/widgets/Text_Field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final addressController=TextEditingController();
  final passwordController=TextEditingController();

  AuthenticationMethod authenticationMethod=AuthenticationMethod();
  bool isLoading=false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screensize=Utils().getScreenSize();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: screensize.height,
            width: screensize.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
              child: Center(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(amazonLogo,height: screensize.height*0.1,),
                    SizedBox(
                      height: screensize.height*0.7,
                      width: screensize.width*1,
                      child: FittedBox(
                        child: Container(
                            height: screensize.height*0.85,
                            width: screensize.width*1,
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey,width: 1),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Sign Up',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),),
                                TextFieldWidget(
                                  title: "Name",
                                  hintText: "Enter Name here",
                                  controller: nameController,
                                  obscureText: false,
                                ),
                                TextFieldWidget(
                                  title: "Address",
                                  hintText: "Enter Address here",
                                  controller: addressController,
                                  obscureText: false,
                                ),
                                TextFieldWidget(
                                  title: "Email",
                                  hintText: "Enter Email here",
                                  controller: emailController,
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
                                      child:const  Text("Sign Up",style: TextStyle(fontSize: 17),),
                                      color: Colors.orange,
                                      isLoading: isLoading,
                                      onPressed: ()async{

                                        setState(() {
                                          isLoading=true;
                                        });

                                       String output= await authenticationMethod.signUpUser(
                                            name: nameController.text,
                                            address: addressController.text,
                                            email: emailController.text,
                                            password: passwordController.text);

                                       setState(() {
                                         isLoading=false;
                                       });

                                       if(output=="success") {
                                         Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>const  SignInScreen(),));
                                         }
                                       else{
                                         Utils().showSnackBar(context: context, content:output);
                                       }
                                       emailController.clear();
                                       passwordController.clear();
                                       addressController.clear();
                                       nameController.clear();



                                      }),
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                    CustomMainButton(
                        child:Text("Back"),
                        color: Colors.grey[400]!,
                        isLoading: false,
                        onPressed: (){
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>const  SignInScreen(),));

                        }),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
