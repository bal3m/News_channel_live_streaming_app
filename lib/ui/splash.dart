import 'dart:async';
import 'package:almustaqbal/ui/home.dart';
import 'package:almustaqbal/ui/introScreen.dart';
import 'package:almustaqbal/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:almustaqbal/main.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future checkFirstSeen() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        bool _seen = (prefs.getBool('seen') ?? false);

        if (_seen) {
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new NavBar()));
        } else {
        await prefs.setBool('seen', true);
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new Intro()));
        }
    }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () => checkFirstSeen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: HexColor('#424242')),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 35, 0),
                    child: Center(child: Image.asset('images/Lfu.png')),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
//                      backgroundColor: Color.fromRGBO(212, 175, 55, 1),
                      valueColor: new AlwaysStoppedAnimation<Color>(Color.fromRGBO(212, 175, 55, 1),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
//                    Text(
//                      ,
//                      softWrap: true,
//                      textAlign: TextAlign.center,
//                      style: TextStyle(
//                          fontWeight: FontWeight.bold,
//                          fontSize: 18.0,
//                          color: Colors.white),
//                    )
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