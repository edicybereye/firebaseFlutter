import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreSession extends StatefulWidget {
  @override
  _FirestoreSessionState createState() => _FirestoreSessionState();
}

class _FirestoreSessionState extends State<FirestoreSession> {
  String id;
  final db = Firestore.instance;
  final keyform = GlobalKey<FormState>();
  String name, email, phone;

  var buttonType = 1;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  clear() {
    namecontroller.clear();
    emailController.clear();
    phoneController.clear();
  }

  send() async {
    DocumentReference ref = await db.collection("AEJ").add({
      "name": "$name",
      "email": "$email",
      "phone": "$phone",
    });
    setState(() {
      id = ref.documentID;
    });
    print(ref.documentID);
    clear();
  }

  readdata() async {
    DocumentSnapshot snapshot = await db.collection("AEJ").document(id).get();
    print(snapshot.data['name']);
  }

  Card buildItem(DocumentSnapshot e) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(e.data['name']),
                  Text(e.data['email']),
                  Text(e.data['phone']),
                ],
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            IconButton(
              onPressed: () {
                update(e);
              },
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                delete(e);
              },
              icon: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }

  update(DocumentSnapshot e) async {
    setState(() {
      id = e.documentID;
      buttonType = 2;
      namecontroller = TextEditingController(text: e['name']);
      phoneController = TextEditingController(text: e['phone']);
      emailController = TextEditingController(text: e['email']);
    });
  }

  delete(DocumentSnapshot e) async {
    await db.collection("AEJ").document(e.documentID).delete();
    setState(() {
      id = null;
    });
  }

  edit() async {
    await db.collection("AEJ").document(id).updateData({
      "name": "$name",
      "email": "$email",
      "phone": "$phone",
    });
    clear();
    setState(() {
      id = null;
      buttonType = 1;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firestore Session"),
        elevation: 1.0,
      ),
      body: Container(
        child: Form(
          key: keyform,
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              TextFormField(
                controller: namecontroller,
                onSaved: (e) => name = e,
                decoration: InputDecoration(labelText: "Fullname"),
                validator: (e) {
                  if (e.isEmpty) {
                    return "Please fill your name";
                  }
                },
              ),
              TextFormField(
                controller: emailController,
                onSaved: (e) => email = e,
                decoration: InputDecoration(labelText: "Email Address"),
                validator: (e) {
                  if (e.isEmpty) {
                    return "Please fill your email";
                  }
                },
              ),
              TextFormField(
                controller: phoneController,
                onSaved: (e) => phone = e,
                decoration: InputDecoration(labelText: "Phone Number"),
                validator: (e) {
                  if (e.isEmpty) {
                    return "Please fill your phone number";
                  }
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              RaisedButton(
                onPressed: () {
                  if (keyform.currentState.validate()) {
                    keyform.currentState.save();
                    buttonType == 1 ? send() : edit();
                  }
                },
                child: Text(buttonType == 1 ? "Save" : "Edit"),
              ),
              SizedBox(
                height: 16.0,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: db.collection("AEJ").snapshots(),
                builder: (context, i) {
                  if (i.hasData) {
                    // return Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children:
                    //         i.data.documents.map((e) => buildItem(e)).toList());
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: i.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot snapshot = i.data.documents[index];
                        return buildItem(snapshot);
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
