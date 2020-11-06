import 'package:bmi_calculator/BmiModel.dart';
import 'package:bmi_calculator/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';
class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  var height=100.0;
  var weight=50.0;
  var ans;
  BmiModel bm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:SingleChildScrollView( 
         child:Container(
            width:double.infinity,
           padding: EdgeInsets.all(32),
           child:Column(
         children: <Widget>[
           Center(child:Container(
           height:400,
           width:400,
           padding: EdgeInsets.all(32),
           child:SvgPicture.asset("assets/heart.svg"))),
           Text("BMI Calculator",style:TextStyle(color:Colors.red,fontSize:25,fontWeight:FontWeight.w500),),
            Text("We care about your health",style:TextStyle(color:Colors.grey,fontSize:10,fontWeight:FontWeight.w300),),
            SizedBox(height:15,),
             Text("Height (cm)",style:TextStyle(color:Colors.grey,fontSize:35,fontWeight:FontWeight.w400),),
                Container(
               padding:EdgeInsets.all(12),
               child:Slider(
                 activeColor:Colors.red,
                 divisions:100 ,
                 label:"$height",
                 min:80.0,
                 max: 250.0,
                 onChanged:(height){
                   setState(() {
                        this.height=height;
                   });
                
                 }, value: this.height,
               ),
             ),
             Text("$height(cm)",style:TextStyle(color:Colors.red,fontSize:18,fontWeight:FontWeight.w300),),
            SizedBox(height:15,),
             Text("Weight (kg)",style:TextStyle(color:Colors.grey,fontSize:35,fontWeight:FontWeight.w400),),
             SizedBox(height:15,),
                Container(
               padding:EdgeInsets.all(12),
               child:Slider(
                 activeColor:Colors.red,
                 divisions:100 ,
                 label:"$weight",
                 min:30.0,
                 max: 120.0,
                 onChanged:(weight){
                   setState(() {
                        this.weight=weight;
                   });
                
                 }, value: this.weight,
               ),
             ),
              Text("$weight(kg)",style:TextStyle(color:Colors.red,fontSize:18,fontWeight:FontWeight.w300),),
              SizedBox(height:15,),
              Container(width:double.infinity,color:Colors.pink,child:FlatButton.icon(icon:Icon(Icons.favorite),label:Text("Calculate BMI"),onPressed:(){
                setState(() {
                  ans=this.weight/((height/100)*(height/100));
                  if(ans>=18.5&&ans<=25)
                  {
                   bm=BmiModel(ans, true, "You are normal");
                  }
                else if(ans<18.5)
                  {
                    bm=BmiModel(ans, false, "You are Underweighted");
                  }
                   else if(ans<25&&ans<=35)
                  {
                    bm=BmiModel(ans, false, "You are Overweighted");
                  }
                   else 
                  {
                   bm=BmiModel(ans, false, "You are obessed");
                  }
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>ResultScrenn(bm)));
                });
              } ,))

           ],))));
  }
}