import 'package:amazon_clone/Models/UserDetails.dart';
import 'package:amazon_clone/utils/colors_theme.dart';
import 'package:amazon_clone/utils/constansts.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class UserDetailsBar extends StatelessWidget {
  final double offset;
  final UserDetailsModel userDetails;
  const UserDetailsBar({Key? key,required this.offset,required this.userDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screensize=Utils().getScreenSize();
    return Positioned(
      top: -offset/5,
      child: Container(
        height: kAppBarHeight/2,
        width: screensize.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: lightBackgroundaGradient,begin: Alignment.bottomLeft,end: Alignment.centerRight)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.location_on_outlined,color: Colors.grey[900],),
              ),
              SizedBox(
                width: screensize.width*0.7,
                  child: Text("Deliver to ${userDetails.name} - ${userDetails.address}",style: TextStyle(color: Colors.grey[900]),overflow: TextOverflow.ellipsis,maxLines: 1,)),
            ],
          ),
        ),

      ),
    );
  }
}
