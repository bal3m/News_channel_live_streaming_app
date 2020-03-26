import 'dart:io';
import 'package:almustaqbal/util/colors.dart';
import 'package:flutter/material.dart';
import 'Data/info.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
 Size devise_size;
  int currentIndex = 3;

  int r = 212;

  int g = 175;

  int b = 55;
  @override
  Widget build(BuildContext context) {
    devise_size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
            backgroundColor:   Colors.grey.shade100,

      appBar: AppBar(
        title: Center(
            child: Text(
          'Your title',
          textDirection: TextDirection.rtl,
          style: TextStyle(fontFamily: 'Tajawal',color: Colors.white,fontWeight: FontWeight.bold),
        )),
        backgroundColor: HexColor('#424242'),
      ),

      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset(
                info[0]['image'],
                height: 200,
                width: 300,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Column(
                    children: <Widget>[
                      Text(
                        info[0]['content'],
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(75, 0, 0, 0),
                            child: AboutListTile(
                              applicationIcon: Image.asset(
                                "images/Lfu.png",
                                height: 80,
                                width: 100,
                              ),
                              aboutBoxChildren: <Widget>[
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  " Your Info",
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                              applicationName: "Your title",
                              applicationVersion: "1.0.0",
//                     applicationLegalese: "Apache License 2.0",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}