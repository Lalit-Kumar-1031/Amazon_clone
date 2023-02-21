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

  late FocusNode focusNode;
  bool isInFocus=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode=FocusNode();
    focusNode.addListener(() {
      if(focusNode.hasFocus)
        {
          setState(() {
            isInFocus=true;
          });
        }
      else
        {
          setState(() {
            isInFocus=false;
          });
        }
    });
  }

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
           Container(
             decoration: BoxDecoration(
               boxShadow: [
                 isInFocus? BoxShadow(
                   color: Colors.orange.withOpacity(0.5),blurRadius: 8,spreadRadius: 2
                 ):
                 BoxShadow(
                     color: Colors.black.withOpacity(0.5),blurRadius: 8,spreadRadius: 2
                 ),
               ]
             ),
             child: TextFormField(
               controller: widget.controller,
               focusNode: focusNode,
               obscureText: widget.obscureText,
               decoration: InputDecoration(

                 /*
                 If you are using stateful widget for creating model then to access every field used widget
                 if you are using stateless widget for creating model then you don't widget to access filed
                 Ex- In this example i am using stateful widget then i am using widget to access field like
                 hintText: widget.hintText

                  */


                 hintText: widget.hintText,
                 fillColor: Colors.white,
                 filled: true,
                 border:  OutlineInputBorder(
                   borderRadius: BorderRadius.circular(5),
                   borderSide: const BorderSide(
                     color: Colors.grey,
                     width: 1,
                   )
                 ),
                 focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: Colors.grey,
                     width: 1,
                   ),
                 )
               ),
             ),
           )

      ],
      );

  }
}
