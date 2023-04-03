import 'package:amazon_clone/Models/Product_Model.dart';
import 'package:amazon_clone/Models/UserDetails.dart';
import 'package:amazon_clone/utils/colors_theme.dart';
import 'package:amazon_clone/widgets/CustomMainButton.dart';
import 'package:amazon_clone/widgets/Search_Bar.dart';
import 'package:amazon_clone/widgets/UserDetailsBar.dart';
import 'package:amazon_clone/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(hasBackButton: false, isReadOnly: true),
        body: Column(
          children: [
            UserDetailsBar(
                offset: -0,
                userDetails: UserDetailsModel(
                    name: "Lalit", address: "Kurukshetra , Haryana")),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomMainButton(
                  color: yellowColor,
                  isLoading: false,
                  onPressed: () {},
                  child: const Text(
                    "Proceed to buy (n) itams",
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    productModel: ProductModel(
                      url:
                          "https://m.media-amazon.com/images/I/11dGLeeNRcL._SS70_.png",
                      productName: "Kurukshetra Mobile Shop",
                      cost: 2000,
                      sellerName: "Lalit Kumar",
                      discount: 0,
                      noOfrating: 5,
                      rating: 4,
                      sellerUid: "1234",
                      Uid: "101"
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
