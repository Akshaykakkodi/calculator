import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  var charItems;
  var index;

  List items=["+","-","*","/"];

   Button( {super.key,required this.charItems,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
                      decoration: BoxDecoration(
                        color:items.contains(charItems[index])? Colors.orange:charItems[index]=="="?Colors.blue:Colors.white,
                        border:  Border.all(
                          color: Colors.black,
                           width: 0.5
                        )
                      ),
                      child: Center(
                        child: Text(
                          charItems[index].toString(),
                          style:const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                          )
                          ),
                    );
  }
}