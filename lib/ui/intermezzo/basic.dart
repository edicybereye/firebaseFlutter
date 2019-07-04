import 'package:flutter/material.dart';

class MyAppSTF extends StatefulWidget {
  @override
  _MyAppSTFState createState() => _MyAppSTFState();
}

class _MyAppSTFState extends State<MyAppSTF> {
  var button = true;
  rubah() {
    setState(() {
      button = !button;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(button ? "Intermezzo Steful" : " Yeeeaaahh..."),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    Colors.orange,
                    Colors.red,
                  ])),
              child: Text(
                "Click Here",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyAppSTL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text("Intermezzo Basic"),
        ),
      ),
    );
  }
}
