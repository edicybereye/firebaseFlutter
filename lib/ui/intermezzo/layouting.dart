import 'package:flutter/material.dart';

class LayoutingColumn extends StatefulWidget {
  @override
  _LayoutingColumnState createState() => _LayoutingColumnState();
}

class _LayoutingColumnState extends State<LayoutingColumn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout Column"),
        elevation: 1.0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.orange),
            ),
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), color: Colors.red),
            ),
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

class LayoutingRow extends StatefulWidget {
  @override
  _LayoutingRowState createState() => _LayoutingRowState();
}

class _LayoutingRowState extends State<LayoutingRow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout Row"),
        elevation: 1.0,
      ),
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 200.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.orange),
            ),
            Container(
              width: 200.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), color: Colors.red),
            ),
            Container(
              width: 200.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

class LayoutingStack extends StatefulWidget {
  @override
  _LayoutingStackState createState() => _LayoutingStackState();
}

class _LayoutingStackState extends State<LayoutingStack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layouting Stack"),
        elevation: 1.0,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              top: 150.0,
              left: 10.0,
              right: 10.0,
              child: Container(
                height: 100.0,
                width: 100.0,
                child: CircleAvatar(
                  child: Material(
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "Testing",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
