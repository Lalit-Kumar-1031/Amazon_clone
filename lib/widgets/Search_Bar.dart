import 'package:amazon_clone/Screens/SearchScreen.dart';
import 'package:amazon_clone/utils/colors_theme.dart';
import 'package:amazon_clone/utils/constansts.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackButton;
  SearchBarWidget({Key? key,required this.isReadOnly,required this.hasBackButton})
      : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  OutlineInputBorder border=OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: Colors.grey,width: 1,
    )
  );

  @override
  Widget build(BuildContext context) {
    Size screensize=Utils().getScreenSize();
    return Container(
      height: kAppBarHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: backgroundGradient,
            begin: Alignment.bottomLeft,
            end: Alignment.centerRight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          hasBackButton?IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:Icon(Icons.arrow_back)):Container(),
          SizedBox(
            width: screensize.width*0.7,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.35),
                      blurRadius: 8,spreadRadius: 1,offset: const Offset(0,5)
                    )
                  ]
                ),
                child: TextFormField(
                  readOnly: isReadOnly,
                  onTap: (){

                    if(isReadOnly){

                      Navigator.push(context,MaterialPageRoute(builder: (context) =>const  SearchScreen(),));
                    }

                  },
                  decoration: InputDecoration(
                   fillColor: Colors.white,
                    hintText: "Search something in amazon",
                    hintStyle: TextStyle(fontSize: 13),
                    filled: true,
                    border: border,
                    focusedBorder: border,
                  ),
                ),
              ),
          ),
          IconButton(onPressed: (){}, icon:const  Icon(Icons.mic_none_outlined),),
        ],
      ),
    );
  }
}
