import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

web(wphost, wpuser, wppass, dbname, volume, osname, link, imagename) async {
  var url =
      "http://192.168.29.56/cgi-bin/wp.py?z=${wphost}&a=${wpuser}&b=${wppass}&c=${dbname}&d=${volume}&x=${osname}&e=${link}&y=${imagename}";
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

String wphost;
String wpuser;
String wppass;
String dbname;
String volume;
String osname;
String link;
String imagename;

class MyWp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.laptop_chromebook),
        title: Text('WORDPRESS CONTAINER'),
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
                      wphost = val;
                    },
                    autocorrect: false,
                    cursorColor: Colors.blue,
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      hintText: 'Enter WP Host ',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    onChanged: (val) {
                      wpuser = val;
                    },
                    autocorrect: false,
                    cursorColor: Colors.blue,
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      hintText: 'Enter WP User ',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    onChanged: (val) {
                      wppass = val;
                    },
                    autocorrect: false,
                    cursorColor: Colors.blue,
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      hintText: 'Enter WP Password ',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    onChanged: (val) {
                      dbname = val;
                    },
                    autocorrect: false,
                    cursorColor: Colors.blue,
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      hintText: 'Enter Database name ',
                      border: const OutlineInputBorder(),
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
                      border: const OutlineInputBorder(),
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
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    onChanged: (val) {
                      link = val;
                    },
                    autocorrect: false,
                    cursorColor: Colors.blue,
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      hintText: 'Enter MYSQL OS Name ',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    onChanged: (val) {
                      imagename = val;
                    },
                    autocorrect: false,
                    cursorColor: Colors.blue,
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                      hintText: 'Enter Image Name ',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Card(
                  child: FlatButton(
                      color: Colors.black,
                      onPressed: () {
                        final play = AudioCache();
                        play.play('webserver.mp3');
                        myt2();
                        web(wphost, wpuser, wppass, dbname, volume, osname,
                            link, imagename);
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
