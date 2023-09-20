import 'package:flutter/material.dart';

class Calculation{
 static double result=0;


Calculation();

static void calculate(input){
  var userInput=input;
  List sign=["+","-","/","*"];
  var operand;
   sign.forEach((e){
    if (userInput.contains(e))
    {
      operand=e;
    } 
  });
  int b= userInput.indexOf(operand);
   var first= userInput.substring(0,b);
  var second=userInput.substring(b+1);
   if(operand=="+"){
    result=double.parse(first)+double.parse(second);
   }else if(operand=="-"){
    result=double.parse(first)-double.parse(second);
   }
   else if(operand=="*"){
    result=double.parse(first)*double.parse(second);
   }else if(operand=="/"){
    result=double.parse(first)/double.parse(second);
   }
}


}