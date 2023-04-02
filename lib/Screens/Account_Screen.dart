import 'package:amazon_clone/utils/colors_theme.dart';
import 'package:amazon_clone/utils/constansts.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/CustomMainButton.dart';
import 'package:amazon_clone/widgets/Products_showcase_list_view.dart';
import 'package:amazon_clone/widgets/Simple_Product_Widget.dart';
import 'package:amazon_clone/widgets/account_screen_appbar.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  List<Widget> ads1= const [
     SimpleProductWidget(url:"https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg"),
    SimpleProductWidget(url: "https://m.media-amazon.com/images/I/61fiSvze0eL._SX3000_.jpg"),
    SimpleProductWidget(url: "https://m.media-amazon.com/images/I/61jmYNrfVoL._SX3000_.jpg"),
    SimpleProductWidget(url: "https://m.media-amazon.com/images/I/11qyfRJvEbL._SX90_SY90_.png"),
    SimpleProductWidget(url: "https://m.media-amazon.com/images/I/61fiSvze0eL._SX3000_.jpg"),
    SimpleProductWidget(url: "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png"),
  ];
  @override
  Widget build(BuildContext context) {
    Size screensize = Utils().getScreenSize();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AccountScreenAppBar(),
        body: Center(
            child: SingleChildScrollView(
          child: SizedBox(
            height: screensize.height,
            width: screensize.width,
            child: Column(
              children:  [
                UserDetailWidget(),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMainButton(child: Text("Sign In",style: TextStyle(color: Colors.black),), color: Colors.orange, isLoading: false, onPressed:(){}),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMainButton(child: Text("Sell",style: TextStyle(color: Colors.black),), color: Colors.yellow, isLoading: false, onPressed:(){}),
                ),
                ProductShowCaseListView(title: "Your Orders", children: ads1),
                Text("Order Requests ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Order : White T-Shirts ",style: TextStyle(fontWeight: FontWeight.w600),),
                      subtitle: Text("Address : Kurukshetra , Haryana"),
                      trailing: IconButton(icon: Icon(Icons.check),onPressed: (){},),
                    );
                  },),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}










class UserDetailWidget extends StatelessWidget {
  const UserDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight / 2,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: backgroundGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.000000000001),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Hello ,",
                        style: TextStyle(
                            color: Colors.grey[800], fontSize: 23)),
                    TextSpan(
                        text: " Lalit ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                            fontSize: 23)),
                  ])),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzsAYE5AT_P17RuTmpXdZRpPFclxUGt_EaMg&usqp=CAU"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

