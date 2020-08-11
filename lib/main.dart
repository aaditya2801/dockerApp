import 'dart:async';
import 'package:MaddyDocker/local.dart';
import 'package:MaddyDocker/wp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'mysql.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

_launchURL2() async {
  const url = 'http://192.168.29.56:8080';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

var url =
    "https://raw.githubusercontent.com/aaditya2801/myflutter/master/1_j_zP74-cpvXRcs8dM_pkMQ.jpeg";

_launchURL() async {
  const url = 'https://hub.docker.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

myapp1() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.grey);
}

myt() {
  Fluttertoast.showToast(
      msg: "This is Aaditya!! FLUTTER TASK 1 !! AUDIO & VIDEO PLAYER",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 6,
      backgroundColor: Colors.amber,
      textColor: Colors.white,
      fontSize: 16.0);
}

myprint() {
  print('AADITYA  !! ');
}

class MyDrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Image.network(
                      'https://raw.githubusercontent.com/aaditya2801/myflutter/master/unnamed.png')),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            new ListTile(
              title: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.laptop_windows), onPressed: null),
                  Text('LOCAL CMD')
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Local()));
              },
            ),
            new ListTile(
              title: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.laptop_windows), onPressed: null),
                  Text('DB LAUNCHER')
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new MySql()));
              },
            ),
            new ListTile(
              title: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.laptop_windows), onPressed: null),
                  Text('SERVER LAUNCHER')
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new MyWp()));
              },
            ),
            new ListTile(
                title: Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.chrome_reader_mode), onPressed: null),
                    Text('WORDPRESS SITE')
                  ],
                ),
                onTap: _launchURL2),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('DOCKER'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.account_circle), onPressed: _launchURL)
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.shade200,
        margin: EdgeInsets.all(20),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                  width: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new MyDrawerApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.lightBlue),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 70.0,
                        child: Image.network(
                            'https://raw.githubusercontent.com/aaditya2801/myflutter/master/docker2.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        'DOCKER',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      'OS-level Virtualization \n Docker Containers',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
