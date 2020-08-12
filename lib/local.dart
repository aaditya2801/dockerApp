import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

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
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  child: Card(
                    color: Colors.black,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(00),
                            bottomRight: Radius.circular(00),
                            topRight: Radius.circular(50)),
                        side: BorderSide(width: 6, color: Colors.red)),
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (val) {
                        command = val;
                      },
                      autocorrect: false,
                      cursorColor: Colors.blue,
                      style: TextStyle(height: 1, color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Enter Linux Command ',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topRight: Radius.circular(100)),
                      side: BorderSide(width: 6, color: Colors.red)),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      color: Colors.black,
                      onPressed: () {
                        final play = AudioCache();
                        play.play('console.mp3');
                        web(command);
                      },
                      child: Icon(
                        Icons.settings_power,
                        color: Colors.white,
                      )),
                ),
                Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.black,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(00),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(00)),
                        side: BorderSide(width: 6, color: Colors.red)),
                    child: Text(
                      webdata ?? "                       WELCOME TO CONSOLE...",
                      style: TextStyle(height: 3, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
