import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:developer' as developer;
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'raceMath',
      theme: ThemeData(
          primaryColor: Colors.deepPurple,
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.black54,
            displayColor: Colors.green,
          )
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //primarySwatch: Colors.,
      ),
      home: MyHomePage(title: 'raceMath'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _expression1 = '';
  String _expression2 = '';
  bool _isOK;
  String _message = '';
  Color bgColor;
  int score = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _operation1();
    bgColor = Colors.white;

  }


    Map _operation1() {
    var num1 = new Random();
    var num2 = new Random();
    var result = new Random();
    var answer = new Random().nextInt(3);
    int inum1 = num1.nextInt(20);
    int inum2 = num2.nextInt(20);

    inum1 = inum1.toInt();
    inum2 = inum2.toInt();
    int average = ((inum2 + inum1)).toInt();
    int iresult;
    if (answer == 0){
      iresult = inum2 + inum1;
      _isOK = true;
    }else{
      iresult = result.nextInt(average);
      _isOK = false;
    }
    iresult = iresult.toInt();
    var sum = inum2 + inum1;


    var expression = {
      num1: num1,
      num2: num2,
      result: result,
    };
    setState(() {
      _expression1 = '${inum1} + ${inum2} = ';
      _expression2 = '$iresult';
      _isOK;
      developer.log("isok : $_isOK");
    });
    return expression;

  }

  check_answer(answer){
    developer.log("the answer is $_isOK");
    if(!answer == _isOK){
      setState(() {
        //loseMessage();
        bgColor = Colors.red[300];
        score--;
      });
    }else{
      //winMessage();
      _operation1();
      bgColor = Colors.green[300];
      score++;
    }
  }

  loseMessage(){
    Fluttertoast.showToast(
        msg: "you lose!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  winMessage(){
    Fluttertoast.showToast(
        msg: "you win!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children:[
          Align(
            alignment: Alignment.topLeft,
            child:  Text('score: $score', style: TextStyle(fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
          ),
          Center(
            heightFactor: 3,
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Text(
                //   'You have pushed the button this many times:',
                // ),


                Text('$_expression1',
                  style:  TextStyle(fontSize: 70, fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                Text('$_expression2',
                  style:  TextStyle(fontSize: 70, fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,

                ),

              ],
            ),

          ),
        ]

      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          // FloatingActionButton(
          //   onPressed: _operation1,
          //   tooltip: 'Increment',
          //   child: Icon(Icons.add),
          // )

          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.green)),
            color: Colors.white,
            textColor: Colors.green,
            padding: EdgeInsets.all(8.0),
            onPressed: () => check_answer(true),
            child: Text(
              "true".toUpperCase(),
              style: TextStyle(
                fontSize: 34.0,
              ),
            ),
          ),
          SizedBox(width: 20),
          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.red)),
            color: Colors.white,
            textColor: Colors.red,
            padding: EdgeInsets.all(8.0),
            onPressed: () => check_answer(false),
            child: Text(
              "Wrong".toUpperCase(),
              style: TextStyle(
                fontSize: 34.0,
              ),
            ),
          ),
        ],
      )
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
