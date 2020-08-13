import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

web(rootpass, mysqluser, mysqlpass, mysqldb, volume, osname) async {
  var url =
      "http://192.168.29.56/cgi-bin/web.py?z=${rootpass}&a=${mysqluser}&b=${mysqlpass}&c=${mysqldb}&d=${volume}&x=${osname}";
  var r = await http.get(url);
  print(r.body);
}

myt2() {
  Fluttertoast.showToast(
      msg: "Container Launched",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 6,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

String rootpass;
String mysqluser;
String mysqlpass;
String mysqldb;
String volume;
String osname;

class MySql extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.laptop_chromebook),
        title: Text('MYSQL CONTAINER'),
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
                      rootpass = val;
                    },
                    autocorrect: false,
                    cursorColor: Colors.blue,
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      hintText: 'Enter Root Password ',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    onChanged: (val) {
                      mysqluser = val;
                    },
                    autocorrect: false,
                    cursorColor: Colors.blue,
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      hintText: 'Enter MYSQL User ',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    onChanged: (val) {
                      mysqlpass = val;
                    },
                    autocorrect: false,
                    cursorColor: Colors.blue,
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      hintText: 'Enter MYSQL Password ',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    onChanged: (val) {
                      mysqldb = val;
                    },
                    autocorrect: false,
                    cursorColor: Colors.blue,
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      hintText: 'Enter Database name ',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    onChanged: (val) {
                      volume = val;
                    },
                    autocorrect: false,
                    cursorColor: Colors.blue,
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      hintText: 'Enter Volume Name ',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    onChanged: (val) {
                      osname = val;
                    },
                    autocorrect: false,
                    cursorColor: Colors.blue,
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      hintText: 'Enter OS Name ',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                ),
                Card(
                  child: FlatButton(
                      color: Colors.black,
                      onPressed: () {
                        final play = AudioCache();
                        play.play('database.mp3');
                        myt2();
                        web(rootpass, mysqluser, mysqlpass, mysqldb, volume,
                            osname);
                      },
                      child: Icon(
                        Icons.settings_power,
                        color: Colors.white,
                      )),
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
