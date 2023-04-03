import 'package:flutter/material.dart';

class CustomRoundedButtom extends StatelessWidget {
  final VoidCallback onpressed;
  final String text;
  const CustomRoundedButtom({Key? key,required this.text,required this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.grey),
          color: Colors.grey[50],
        ),
        child: Text(text),
      ),
    );
  }
}
