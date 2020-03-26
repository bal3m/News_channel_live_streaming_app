import 'package:intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:almustaqbal/ui/home.dart';
import 'package:almustaqbal/util/colors.dart';
class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}
class _IntroState extends State<Intro> {
  List<Slide> slides = new List();
  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "مرحبا",
        description: "Write your welcome",
        pathImage: "images/Lfu.png",
        backgroundColor:HexColor('#150940'),
        styleTitle: TextStyle(color: Colors.white,fontFamily: 'Tajawal',fontSize: 30,fontWeight: FontWeight.bold,),
        styleDescription: TextStyle(color: Colors.white,fontFamily: 'Tajawal',fontSize: 18),

      ),
    );
    slides.add(
      new Slide(
        title: " البرامج",
        description: "في هذه الواجهة يمكنك رؤية مواعيد عرض البرامج على القناة",
        pathImage: "images/clock.png",
        backgroundColor: HexColor('#F2C849'),
        styleTitle: TextStyle(color: Colors.black,fontFamily: 'Tajawal',fontSize: 30,fontWeight: FontWeight.bold,),
        styleDescription: TextStyle(color: Colors.black,fontFamily: 'Tajawal',fontSize: 18),
      ),
    );
    slides.add(
      new Slide(
        title: "نشرات الأخبار",
        description:
        "يمكنك في هذه الواجهة معرفة مواعيد عرض نشرات الأخبار على القناة",
        pathImage: "images/world.png",
        backgroundColor: HexColor('#F29849'),
        styleTitle: TextStyle(color: Colors.black,fontFamily: 'Tajawal',fontSize: 30,fontWeight: FontWeight.bold,),
        styleDescription: TextStyle(color: Colors.black,fontFamily: 'Tajawal',fontSize: 18),
      ),
    );
    slides.add(
      new Slide(
        title: "المباشر",
        description:
        " يمكنك في هذه الواجهة مشاهدة مايعرض في القناة مباشرة أينما كنت",
        pathImage: "images/webinar.png",
        backgroundColor: HexColor('#F2C849'),
        styleTitle: TextStyle(color: Colors.black,fontFamily: 'Tajawal',fontSize: 30,fontWeight: FontWeight.bold,),
        styleDescription: TextStyle(color: Colors.black,fontFamily: 'Tajawal',fontSize: 18),
      ),
    );
    slides.add(
      new Slide(
        title: "حقوق النشر",
        description:
        "Copyrights",
        pathImage: "images/mof.png",
        backgroundColor: HexColor('#150940'),
        styleTitle: TextStyle(color: Colors.white,fontFamily: 'Tajawal',fontSize: 30,fontWeight: FontWeight.bold,),
        styleDescription: TextStyle(color: Colors.white,fontFamily: 'Tajawal',fontSize: 18),
      ),
    );
    slides.add(
      new Slide(
        title: "ابدأ",
        description:
        "كل شي على مايرام،قم بالتجربة اللآن",
        pathImage: "images/start.png",
        backgroundColor: HexColor('#2C5DBF'),
        styleTitle: TextStyle(color: Colors.white,fontFamily: 'Tajawal',fontSize: 30,fontWeight: FontWeight.bold,),
        styleDescription: TextStyle(color: Colors.white,fontFamily: 'Tajawal',fontSize: 18),
      ),
    );
  }
  void onDonePress() {
    Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new NavBar()));
  }
  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}