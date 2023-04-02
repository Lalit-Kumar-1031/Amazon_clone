import 'package:amazon_clone/Layouts/Screen_Layout.dart';
import 'package:amazon_clone/Resources/AuthenticationMethod.dart';
import 'package:amazon_clone/Screens/SignUpScreen.dart';
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
  AuthenticationMethod authenticationMethod=AuthenticationMethod();
  bool isLoading=false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
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
                      Container(
                        height: screensize.height*0.5,
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
                                  isLoading: isLoading,
                                  onPressed: () async{

                                    setState(() {
                                      isLoading=true;
                                    });

                                    String output=await authenticationMethod.signInUser(email: emailcontroller.text, password: passwordController.text);

                                    setState(() {
                                      isLoading=false;
                                    });

                                    if(output=="success"){
                                      //code for next step
                                      Utils().showSnackBar(context: context, content:"Successfull");
                                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ScreenLayout(),));
                                    }
                                    else {
                                      Utils().showSnackBar(context: context, content: output);

                                      }
                                    emailcontroller.clear();
                                    passwordController.clear();
                                  }),
                            ),
                          ],
                        )
                      ),
                      Row(
                        children: [
                          Expanded(child: Container(height: 1,color: Colors.grey,)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text("New To Amazon?",style: TextStyle(color: Colors.grey),),
                          ),
                          Expanded(child: Container(height: 1,color: Colors.grey,)),
                        ],
                      ),
                      CustomMainButton(
                          child:Text("Create an Amazon Account "),
                          color: Colors.grey[400]!,
                          isLoading: false,
                          onPressed: (){
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>const  SignUpScreen(),));
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
