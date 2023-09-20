import 'package:calcurator/button.dart';
import 'package:calcurator/calculation.dart';
import 'package:calcurator/numbers_operands.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {


  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userInput="";

  var answer="0";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:const Text("Calculator"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(userInput,style: const TextStyle(color: Colors.white),),
                  ),
                  Container(
                     alignment: Alignment.centerRight,
                    child: Text(answer,style:const TextStyle(color: Colors.white),),
                  ),
                ],
              ),
              
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    userInput=" ";
                  answer="0";
                  });
                  
                },
                child: Container(
                  height: 80,
                  width: 100,
                  color: Colors.yellow,
                  child:const Center(child: Text("C",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                ),
              ),
             InkWell(
              onTap: () {
                
                setState(() {
                  int len= userInput.length;
                  userInput=userInput.substring(0,len-1);
                  print(userInput);
                });
                
              },
               child: Container(
                  height: 80,
                  width: 100,
                  color: Colors.yellow,
                  child:const Center(child: Text("<",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                ),
             ),
            ],
          ),

          Expanded(
            flex: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black,
                child: GridView.builder(
                        
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemCount: 16,
                  shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemBuilder:(context,index){
                    var charItems=Operands.items;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          userInput+=charItems[index].toString();
                          if(charItems[index]=="="){
                            int a=userInput.indexOf("=");
                            userInput=userInput.substring(0,a);
                            Calculation.calculate(userInput);
                            answer=Calculation.result.toString();
                          }
                        });
                      },
                      child: Button(charItems: charItems, index: index,));
                  } ),
              ),
            ),
          )
        ],
        )
    );
  }
}