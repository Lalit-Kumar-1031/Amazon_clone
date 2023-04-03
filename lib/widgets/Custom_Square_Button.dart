import 'package:flutter/material.dart';

class CustomSquareButtom extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback onpressed;
  final double dimension;
  const CustomSquareButtom({Key? key,required this.child,required this.color,required this.onpressed,required this.dimension}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height:dimension ,
        width: dimension,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1),
            side: BorderSide(color: Colors.grey,width: 1),
          ),
        ),
        child: child,
      ),
    );
  }
}
