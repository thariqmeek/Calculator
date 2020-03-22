import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main()
{
  runApp(Calculator());

}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calci',
      home: Calci(),
      
    );
  }
}

class Calci extends StatefulWidget {
  @override
  _CalciState createState() => _CalciState();
}

class _CalciState extends State<Calci> {

  String eqn="0";
  String result="0";
  String expression=" ";
  double eqnfntsz = 35.0;
  double resfntsz = 45.0;

  btnpressed(String btntxt){

    setState(() {
      if(btntxt == "C"){
        eqn="0";
        result="0";
        eqnfntsz = 35.0;
        resfntsz = 45.0;
        

      }

      else if (btntxt == "⌫"){
        eqnfntsz = 35.0;
        resfntsz = 45.0;

        eqn=eqn.substring(0,eqn.length-1);
        if(eqn=="")
        {
          eqn="0";
        }
      }

        else if(btntxt == "="){

          eqnfntsz = 35.0;
        resfntsz = 45.0;

        expression = eqn;
        expression = expression.replaceAll('x','*');
        expression = expression.replaceAll('÷','/');

        try{
          Parser p =Parser();
          Expression exp =p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';

        }
        catch(e){
          result = "Error";
        }


        
        }

        else{

          eqnfntsz = 35.0;
        resfntsz = 45.0;
        if(eqn == '0')
        {
          eqn= btntxt;
        }
  else{
    eqn = eqn+btntxt;
  }

        }

      }


  
    );

  


  }




  Widget buildbutton(String btntxt,double buttonHeight, Color btncolor ){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: btncolor,
      child:FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(color: Colors.white12,
          width:1,
          style: BorderStyle.solid
          
          ),),
          padding: EdgeInsets.all(16.0),
          onPressed: ()=> btnpressed(btntxt),

          child: Text(
            btntxt,
            style: TextStyle(
              fontSize:30.0,
              fontWeight: FontWeight.normal,
              color:Colors.white,
            ),
          )
 ),

        
        );
  


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Calculator'),
      backgroundColor: Colors.red[600],
      centerTitle: true,),

      body: Column(

        children: <Widget>[


          Container(
            alignment: Alignment.centerRight,
            padding:EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(eqn, style: TextStyle( fontSize:30.0),),
          ),


          Container(
            alignment: Alignment.centerRight,
            padding:EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result, style: TextStyle( fontSize:45.0),),
          ),


        Expanded(child: Divider(),),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width:MediaQuery.of(context).size.width * .75,
              child: Table(
                children: [
                  TableRow(
                    children:[
                    buildbutton("C",1,Colors.red[600]),
                    buildbutton("⌫",1,Colors.orange[600]),
                    buildbutton("÷",1,Colors.orange[600]),
                    ]
                  ),

                  TableRow(
                    children:[
                    buildbutton("7",1,Colors.black),
                    buildbutton("8",1,Colors.black),
                    buildbutton("9",1,Colors.black),
                    ]
                  ),

                  TableRow(
                    children:[
                    buildbutton("4",1,Colors.black),
                    buildbutton("5",1,Colors.black),
                    buildbutton("6",1,Colors.black),
                    ]
                  ),


                  TableRow(
                    children:[
                    buildbutton("1",1,Colors.black),
                    buildbutton("2",1,Colors.black),
                    buildbutton("3",1,Colors.black),
                    ]
                  ),

                  TableRow(
                    children:[
                    buildbutton(".",1,Colors.black),
                    buildbutton("0",1,Colors.black),
                    buildbutton("00",1,Colors.black),
                    ]
                  ),








                ],)
            ),


            Container(
              width:MediaQuery.of(context).size.width * 0.25,
              child: Table(
                children:[
                  TableRow(
                    children: [

                    buildbutton("x" , 1,Colors.orange[600])
                    ]
                    ),

                    TableRow(
                    children: [

                    buildbutton("-" , 1,Colors.orange[600])
                    ]
                    ),TableRow(
                    children: [

                    buildbutton("+" , 1,Colors.orange[600])
                    ]
                    ),

                    TableRow(
                    children: [

                    buildbutton("=" , 2,Colors.red[600])
                    ]
                    ),
                ]
              )

            
            
            
            
            ,)
          ],
        
        
        
        
        
        )




        ],










      ),


      
    );
  }
}