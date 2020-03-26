import 'package:almustaqbal/ui/news.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'stream.dart';
import 'package:almustaqbal/util/colors.dart';
import 'info.dart';
 
class NavBar extends StatefulWidget{
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
   int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
    body: SizedBox.expand(
        child: PageView(
          physics:new NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Home(),
            News(),
            StreamVideo(),
            Info()
          ],
        ),
      ),
      bottomNavigationBar:CurvedNavigationBar(
        // buttonBackgroundColor: Colors.white,
        color: HexColor('#424242'),
        height: 50,
    backgroundColor:HexColor('#d4af37'),
    items: <Widget>[
      Icon(Icons.access_time, size: 25,color: Colors.white,),
      Icon(Icons.public, size: 25,color: Colors.white,),
      Icon(Icons.ondemand_video, size: 25,color: Colors.white,),
      Icon(Icons.info, size: 25,color: Colors.white,),
    ],
    onTap: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
      //Handle button tap
    },
  ),
    );
  }
}