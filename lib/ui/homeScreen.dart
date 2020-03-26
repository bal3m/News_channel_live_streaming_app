import 'package:almustaqbal/ui/Data/programs.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:almustaqbal/util/colors.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int ind=1;
  
  String imgurl =
      'http://w.almustaqbal.ly/wp-content/uploads/2019/06/64627701_442078543247525_3828041687351951360_n.png';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'قناة ليبيا المستقبل',
          textDirection: TextDirection.rtl,
          style: TextStyle(fontFamily: 'Tajawal',color: Colors.white,fontWeight: FontWeight.bold),
        )),
        backgroundColor: HexColor('#424242'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child:
           Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data == null ? 0:data.length,
                itemBuilder: (BuildContext context, int index) {
                  Map prog = data[index];
                  if(prog.isNotEmpty){
                    return InkWell(
                    onTap: (){
                      _showonTapMessage(context, index);
                    },
                                      child: Padding(
                      padding: EdgeInsets.all( 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Stack(
                          children: <Widget>[
                            CachedNetworkImage(
                             imageUrl: prog["image"],
                             placeholder: (context, url) => Image.asset('images/progress.gif'),
                              height: MediaQuery.of(context).size.height/4,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),

                            // Container(
                            //   decoration: BoxDecoration(
                            //     gradient: LinearGradient(
                            //       begin: Alignment.topCenter,
                            //       end: Alignment.bottomCenter,
                            //       // Add one stop for each color. Stops should increase from 0 to 1
                            //       stops: [0.2, 0.7],
                            //       colors: [
                            //          Color.fromARGB(100, 0, 0, 0),
                            //          Color.fromARGB(100, 0, 0, 0),
                            //       ],
                            //       // stops: [0.0, 0.1],
                            //     ),
                            //   ),
                            //   height: MediaQuery.of(context).size.height/4,
                            //   width: MediaQuery.of(context).size.width,
                              
                            // ),


                            Center(

                              child: Container(
                                height: MediaQuery.of(context).size.height/4,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(1),
                                constraints: BoxConstraints(
                                  minWidth: 20,
                                  minHeight: 20,
                                ),
                                // child: Center(
                                //   child: Text(
                                //     prog["title"],
                                //     style: TextStyle(
                                //       color: Colors.white,
                                //       fontSize: 17,
                                //       fontWeight: FontWeight.bold,
                                //     ),
                                //     textAlign: TextAlign.center,
                                //   ),
                                // ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  );
                  }return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Color.fromRGBO(212, 175, 55, 1),
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Color.fromRGBO(27, 38, 50, 1)),
                    ));

                  
                },
              ),
            ),

      
      ),
    );
  }
  //////////////////////////////////////////////////////////

void _showonTapMessage(BuildContext context, int i) {
 Map c =data[i];
   var alert = new AlertDialog(
     title: Text(c['title'],style:TextStyle(fontSize:24,),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
     // title: Text(
     //   "${menu.title}",
     //   textDirection: TextDirection.rtl,
     //   textAlign: TextAlign.center,
     //   style: TextStyle(
     //       fontWeight: FontWeight.bold,
     //       fontSize: 45,
     //       fontFamily: "Scheherazade"),
     // ),
     // titlePadding:
     content: SingleChildScrollView(
            child: Column(
         children: <Widget>[
          //  Image.network(c['image'],height: 150,width: 200,fit: BoxFit.fill,),
           SizedBox(height:5),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
         height: MediaQuery.of(context).size.height/2,
         width: MediaQuery.of(context).size.width,
         child: Padding(
         padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
         child: Column(
         children: <Widget>[
            Text(c['content'],style:TextStyle(fontSize:18,),textDirection: TextDirection.rtl,textAlign: TextAlign.center, ),
            SizedBox(height:5),
            Text(c['time'],style:TextStyle(fontSize:18,),textDirection: TextDirection.rtl,textAlign: TextAlign.center, ),
            SizedBox(height:7),
            RaisedButton.icon
            (
              onPressed: (){_launchURL(context,i);},
               icon: Icon(Icons.launch),
                label: Text('زيارة الموقع'),
                color: Colors.amber,
            )
            // IconButton(
            //      icon:Icon(Icons.launch,color: Colors.indigo,) ,
            //      iconSize: 30,
            //      onPressed: ()=>{
            //        _launchURL(context,i)
            //      }


            //    ),
         ],
         ),
         ),
   ),
       ),

         ],
       ),
     )
   );
   // showDialog(context: context, child: alert);
   showDialog(context: context, builder: (context) => alert);
 }

   _launchURL(BuildContext context, i) async {
    Map link =data[i];
 var url = link['link'];
 if (await canLaunch(url)) {
   await launch(url);
 } else {
   throw 'Could not launch $url';
 }
}
}