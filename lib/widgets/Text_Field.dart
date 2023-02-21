import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;

  const TextFieldWidget({Key? key,required this.title,required this.controller,required this.obscureText,required this.hintText}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Padding(
             padding: const EdgeInsets.only(bottom: 10.0),
             child: Text(widget.title,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
           ),
           TextFormField(
             obscureText: widget.obscureText,
             decoration: InputDecoration(
               hintText: widget.hintText,
               border:  OutlineInputBorder(
                 borderRadius: BorderRadius.circular(5),
                 borderSide: const BorderSide(
                   color: Colors.grey,
                   width: 1,
                 )
               ),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.orange,
                   width: 1,
                 ),
               )
             ),
           )

      ],
      );

  }
}
