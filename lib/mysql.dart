import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

web(rootpass, mysqluser, mysqlpass, mysqldb, volume, osname, imagename) async {
  var url =
      "http://192.168.29.56/cgi-bin/web.py?z=${rootpass}&a=${mysqluser}&b=${mysqlpass}&c=${mysqldb}&d=${volume}&x=${osname}&y=${imagename}";
  var r = await http.get(url);
  print(r.body);
}

myt2() {
  Fluttertoast.showToast(
      msg: "Container Launched",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 6,
      backgroundColor: Colors.amber,
      textColor: Colors.white,
      fontSize: 16.0);
}

String rootpass;
String mysqluser;
String mysqlpass;
String mysqldb;
String volume;
String osname;
String imagename;

class MySql extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.laptop_chromebook),
        title: Text('MYSQL CONTAINER'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Colors.grey,
          child: Column(
            children: [
              Card(
                child: TextField(
                  onChanged: (val) {
                    rootpass = val;
                  },
                ),
              ),
              Card(
                child: TextField(
                  onChanged: (val) {
                    mysqluser = val;
                  },
                ),
              ),
              Card(
                child: TextField(
                  onChanged: (val) {
                    mysqlpass = val;
                  },
                ),
              ),
              Card(
                child: TextField(
                  onChanged: (val) {
                    mysqldb = val;
                  },
                ),
              ),
              Card(
                child: TextField(
                  onChanged: (val) {
                    volume = val;
                  },
                ),
              ),
              Card(
                child: TextField(
                  onChanged: (val) {
                    osname = val;
                  },
                ),
              ),
              Card(
                child: TextField(
                  onChanged: (val) {
                    imagename = val;
                  },
                ),
              ),
              Card(
                child: FlatButton(
                    onPressed: () {
                      myt2();
                      web(rootpass, mysqluser, mysqlpass, mysqldb, volume,
                          osname, imagename);
                    },
                    child: Text('press here')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
