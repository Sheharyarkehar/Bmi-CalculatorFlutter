import 'package:bmi_calculator/BMIScreen.dart';
import 'package:bmi_calculator/BmiModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class ResultScrenn extends StatelessWidget {
  final BmiModel bmi;
  ResultScrenn(this.bmi);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Container(
            width:double.infinity,
           padding: EdgeInsets.all(32),
           child:Column(
             mainAxisAlignment:MainAxisAlignment.center,
             crossAxisAlignment:CrossAxisAlignment.center,
         children: <Widget>[
           Center(child:Container(
           height:400,
           width:400,
           padding: EdgeInsets.all(32),
           child:bmi.isNormal? SvgPicture.asset("assets/happyheart.svg"):SvgPicture.asset("assets/sadheart.svg")))
           ,
           Center(child:Text("Your bmi is ${bmi.bmi.round()}",style:TextStyle(color:Colors.red,fontSize:25,fontWeight:FontWeight.w400,),)),
            SizedBox(height:15,),
            Text("${bmi.comment}",style:TextStyle(color:Colors.red,fontSize:15,fontWeight:FontWeight.w300),),
           SizedBox(height:15,),
           bmi.isNormal?
            Text("Hurray! Your BMI is Normal",style:TextStyle(color:Colors.red,fontSize:10,fontWeight:FontWeight.w400),)
            :
           Text("Sadly! Your BMI is not Normal",style:TextStyle(color:Colors.red,fontSize:10,fontWeight:FontWeight.w400),)
          , SizedBox(height:15,),SizedBox(height:15,),
          Container(width:double.infinity,color:Colors.pink,child:FlatButton.icon(icon:Icon(Icons.query_builder),label:Text("Re-Calculate BMI"), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>BMIScreen()));
            
          },)

           )])));
  }
}