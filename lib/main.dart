import 'package:flutter/material.dart';
import 'package:quizapp/model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const Quiz());
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List quizapp = [
    Model(qstn: "Sunday is holiday",answr: true),
    Model(qstn: "1 million is 20 lak",answr: false),
    Model(qstn: "Flutter is a coding plateform",answr: true),
    Model(qstn: "Ronaldo is best player in the world",answr: true),
    Model(qstn: "Monady is holiday",answr: false),
    Model(qstn: "2 million is 30 lak",answr: false),
    Model(qstn: "Flutter is made for android and ios appliction development",answr: true),
    Model(qstn: "1+1=2",answr: true),
  ];
  List<Icon> ico=[

  ];
  int count=0;
  int qstnnum=0;

  String qstndisplay(){
   return quizapp[qstnnum].qstn;
  }

  void nxtqstn(){
    if(qstnnum<quizapp.length){
      qstnnum++;
    }
  }
  bool answrdisplay(){
    return quizapp[qstnnum].answr;
  }
  int reset(){
    count=0;
    qstnnum=0;
    return qstnnum;
  }
  bool finish(){
    if(qstnnum>=quizapp.length-1){
      return true;
    }else{
      return false;
    }
  }
  void check(bool checking){
    bool value=answrdisplay();
    setState(() {
      if(finish()==true){
        if(count<=4){
          Alert(context: context,title: "END",desc: "You are failed").show();
          reset();
          ico=[];
        }else{
          Alert(context: context,title: "END",desc: "You are passed with $count marks").show();
          reset();
          ico=[];
        }
      }else{
        if(value==checking){
          ico.add(Icon(Icons.check,color: Colors.green,));
          count++;
        }else{
          ico.add(Icon(Icons.close,color: Colors.red,));
        }
        nxtqstn();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 290),
                child: Text(
                  qstndisplay(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
             // SizedBox(height: 290,),
              SizedBox(
                  height: 50,

                  width: double.maxFinite,
                  child: ElevatedButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        check(true);
                      },
                      child: Text(
                        "True",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ))),
              SizedBox(height: 10,),
              SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        check(false);
                      },
                      child: Text(
                        "False",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ))),
              Row(
                children:ico
              ),
            ],
          ),
        ),
      ),
    );
  }
}
