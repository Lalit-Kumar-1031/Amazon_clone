import 'package:amazon_clone/Models/UserDetails.dart';
import 'package:amazon_clone/utils/constansts.dart';
import 'package:amazon_clone/widgets/Banner_ad_widget.dart';
import 'package:amazon_clone/widgets/Category_ListView.dart';
import 'package:amazon_clone/widgets/Products_showcase_list_view.dart';
import 'package:amazon_clone/widgets/Search_Bar.dart';
import 'package:amazon_clone/widgets/Simple_Product_Widget.dart';
import 'package:amazon_clone/widgets/UserDetailsBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller=ScrollController();
  double offset=0;
  List<Widget> ads1=[
    SimpleProductWidget(url:"https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg"),
    SimpleProductWidget(url: "https://m.media-amazon.com/images/I/61fiSvze0eL._SX3000_.jpg"),
    SimpleProductWidget(url: "https://m.media-amazon.com/images/I/61jmYNrfVoL._SX3000_.jpg"),
    SimpleProductWidget(url: "https://m.media-amazon.com/images/I/11qyfRJvEbL._SX90_SY90_.png"),
    SimpleProductWidget(url: "https://m.media-amazon.com/images/I/61fiSvze0eL._SX3000_.jpg"),
    SimpleProductWidget(url: "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png"),
  ];

  List<Widget> ads2=[
    SimpleProductWidget(url:"https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png"),
    SimpleProductWidget(url: "https://m.media-amazon.com/images/I/11qyfRJvEbL._SX90_SY90_.png"),
    SimpleProductWidget(url: "https://m.media-amazon.com/images/I/11M0jYc-tRL._SX90_SY90_.png"),
    SimpleProductWidget(url: "https://m.media-amazon.com/images/I/11qyfRJvEbL._SX90_SY90_.png"),
    SimpleProductWidget(url: "https://m.media-amazon.com/images/I/11yLyO9f9ZL._SX90_SY90_.png"),
    SimpleProductWidget(url: "https://m.media-amazon.com/images/I/11CR97WoieL._SX90_SY90_.png"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        offset=controller.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(
          hasBackButton: false,
          isReadOnly: true,
        ),
        body:Stack(
          children: [
            SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  SizedBox(height: kAppBarHeight/2,),
                  HorizontalCategoryListView(),
                  BannerAdWidget(),
                  ProductShowCaseListView(title: "Upto 70% Off ", children:ads1),
                  ProductShowCaseListView(title: "Upto 60% Off ", children:ads2),
                  ProductShowCaseListView(title: "Upto 40% Off ", children:ads1),
                  ProductShowCaseListView(title: "Explore ", children:ads2),
                ],
              ),
            ),
            UserDetailsBar(offset: offset,userDetails:UserDetailsModel(name: "Lalit ",address: "Kurukshetra , Haryana")),
          ],
        )
      ),
    );
  }
}
