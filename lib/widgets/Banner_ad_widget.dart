import 'package:amazon_clone/utils/colors_theme.dart';
import 'package:amazon_clone/utils/constansts.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({Key? key}) : super(key: key);

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  int currentAd = 0;
  double smallAdsheight=120;
  @override
  Widget build(BuildContext context) {
    Size screensize = Utils().getScreenSize();
    return GestureDetector(
      onHorizontalDragEnd:(_){
        if(currentAd==largeAds.length-1)
        {
          currentAd=-1;
        }
        setState(() {
          currentAd++;
        });
      },
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                largeAds[currentAd],
                width: double.infinity,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: screensize.width,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        backgroundColor,
                        backgroundColor.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: backgroundColor,
            height: screensize.height*0.14,
            width: screensize.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  getsmalladsFromIndex(0,smallAdsheight),
                  getsmalladsFromIndex(1,smallAdsheight),
                  getsmalladsFromIndex(2,smallAdsheight),
                  getsmalladsFromIndex(3,smallAdsheight),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget getsmalladsFromIndex(int index,double height) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 5),
      child: Container(
        height: height,
        width: Utils().getScreenSize().width*0.25,
        decoration: ShapeDecoration(
          color: Colors.white,
          shadows: [BoxShadow(color: Colors.black.withOpacity(0.2),blurRadius: 5,spreadRadius: 1)],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(smallAds[index]),
              SizedBox(height: 6,),
              Text(adItemNames[index]),
            ],
          ),
        ),
      ),
    );
  }

}


