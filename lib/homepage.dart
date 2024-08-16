import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 String equation='0';
 String results ='0';
 String expression='';
  
  void buttontoggle(btntext){
    setState(() {
      if (btntext=='AC'){
        equation='0';
        results='0';

      }else if
        (btntext=='⌫'){
          equation=equation.substring(0,equation.length-1);
          if(equation==''){
            equation='0';
          }

        }else if (btntext=='='){

          expression=equation;

          expression=expression.replaceAll('x', '*');
          expression=expression.replaceAll('÷', '/');

          try{
        Parser p= Parser();
        Expression exp= p.parse(expression);
        ContextModel cm= ContextModel();
        results='${exp.evaluate(EvaluationType.REAL, cm)}';

          }
          catch(e){
           // print("error $e");
          }

        }else{
          if(equation=='0'){
            equation= btntext;
          }else{
          equation = equation+btntext;
        }
        }
      
    });
  }

 Widget buttons( String btntext,Color txtcolor,double btnWidth,Color btncolor){
return  InkWell(
  onTap: (){
    buttontoggle(btntext);
  },
  child: Container(
              alignment: Alignment.center,
              height: 80,
              width: btnWidth,
              decoration: BoxDecoration(color:btncolor ,borderRadius:BorderRadius.circular(50) ),
              child: Text(btntext,style: TextStyle(color: txtcolor,fontSize: 25,fontWeight: FontWeight.w500),),
            ),
);
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        
      ),
     // drawer: Drawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const  SizedBox(height: 15,),
         Expanded(
           child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.centerRight,
            width: double.infinity,
            height: 90,
            color: Colors.black26,
            child: SingleChildScrollView(child: Text(equation,style: const TextStyle(color: Colors.deepOrangeAccent,fontSize: 30),)),
           ),
         ) ,
           const  SizedBox(height: 15,),
         Expanded(
           child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.centerRight,
            width: double.infinity,
            height: 90,
            color: Colors.black26,
            child: SingleChildScrollView(child: Text(results,style:const TextStyle(color: Colors.white,fontSize: 40),)),
           ),
         ),
        const Divider(thickness: 2,color: Colors.grey,) ,
          const SizedBox(height: 15,),
         Expanded(
          flex: 8,
           child: Column(
             children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttons('AC', Colors.white, 80,Colors.deepOrangeAccent[100]! ),
                  buttons('%', Colors.white, 80,Colors.deepOrangeAccent[100]! ),
                  buttons('÷', Colors.white, 80,Colors.deepOrangeAccent[100]! ),
                  buttons('⌫', Colors.white, 80,Colors.deepOrangeAccent[100]! ),
                
               ],),
               const SizedBox(height: 15,),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttons('7', Colors.white, 80,Colors.white24 ),
                  buttons('8', Colors.white, 80,Colors.white24 ),
                  buttons('9', Colors.white, 80,Colors.white24 ),
                  buttons('x', Colors.white, 80,Colors.deepOrangeAccent[100]! ),
                
               ],),
                const SizedBox(height: 15,),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttons('4', Colors.white, 80,Colors.white24 ),
                  buttons('5', Colors.white, 80,Colors.white24 ),
                  buttons('6', Colors.white, 80,Colors.white24 ),
                  buttons('+', Colors.white, 80,Colors.deepOrangeAccent[100]! ),
                
               ],),
                const SizedBox(height: 15,),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttons('1', Colors.white, 80,Colors.white24 ),
                  buttons('2', Colors.white, 80,Colors.white24 ),
                  buttons('3', Colors.white, 80,Colors.white24 ),
                  buttons('-', Colors.white, 80,Colors.deepOrangeAccent[100]! ),
                
               ],),
                 const SizedBox(height: 15,),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttons('.', Colors.white, 80,Colors.white24 ),
                  buttons('0', Colors.white, 180,Colors.white24 ),
                 // buttons('.00', Colors.white, 80,Colors.white24 ),
                  buttons('=', Colors.white, 80,Colors.deepOrangeAccent[100]! ),
                
               ],),
           
             ],
           ),
         )
          ],)),
    );
  }
}