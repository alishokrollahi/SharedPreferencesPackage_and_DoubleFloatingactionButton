import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'dart:async';





class myhome extends StatefulWidget {
  @override
  _myhomeState createState() => _myhomeState();
}

class _myhomeState extends State<myhome> {
  @override
  var number;
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }


  check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    number = prefs.getInt('number')?? 0;
    await prefs.setInt('number', number);
  }




  submit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('number', number);
  }




  void increase_number(){
    setState(() {
      number+=1;
    });
  }


  void decrease_number(){
    setState(() {
      number-=1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('shared_preferences package'),
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Text(number.toString()),
                Padding(padding: EdgeInsets.only(top: 20)),
              ],
            )
          )
        ],
      ),
        floatingActionButton: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                child : Icon(Icons.add_circle),
                backgroundColor: Colors.pinkAccent,
                onPressed: (){
                  submit();
                  increase_number();
                },
              ),
              Padding(padding: EdgeInsets.only(bottom: 17),),
              FloatingActionButton(
                child: Icon(Icons.do_not_disturb_on),
                backgroundColor: Colors.deepOrange,
                onPressed: (){
                  submit();
                  decrease_number();
                },)
            ],
          ),
        ),
      ),
    );
  }
}
