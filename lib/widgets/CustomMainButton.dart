import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool isLoading;
  final VoidCallback onPressed;
  const CustomMainButton(
      {Key? key,
      required this.child,
      required this.color,
      required this.isLoading,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screensize = Utils().getScreenSize();
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: Size(screensize.width * 0.6, 40),
      ),
      child: !isLoading
          ? child
          : Padding(
            padding:EdgeInsets.symmetric(vertical: 5) ,
              child: AspectRatio(
                aspectRatio: 1/1,
                child: CircularProgressIndicator(
                color: Colors.white,
            ),
              )),
    );
  }
}
