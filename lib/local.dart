import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

myt2() {
  Fluttertoast.showToast(
      msg: "Docker Configured",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 6,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

String command;

class Local extends StatefulWidget {
  @override
  _LocalState createState() => _LocalState();
}

class _LocalState extends State<Local> {
  var webdata;
  web(command) async {
    var url = "http://192.168.29.56/cgi-bin/local.py?x=${command}";
    var r = await http.get(url);
    setState(() {
      webdata = r.body;
    });
    print(webdata);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.laptop_chromebook),
        title: Text('LOCAL CMD'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.blueGrey,
            child: Column(
              children: [
                Card(
                  child: TextField(
                    onChanged: (val) {
                      command = val;
                    },
                    autocorrect: false,
                    cursorColor: Colors.blue,
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      hintText: 'Enter Linux Command ',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Card(
                  child: FlatButton(
                      color: Colors.black,
                      onPressed: () {
                        web(command);
                      },
                      child: Icon(
                        Icons.settings_power,
                        color: Colors.white,
                      )),
                ),
                Card(
                  child: Text(webdata ?? "output is coming..."),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}
