import 'package:almustaqbal/util/colors.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class StreamVideo extends StatefulWidget {
  StreamVideo({this.title = 'ليبيا المستقبل'});
  final String title;
  @override
  State<StatefulWidget> createState() {
    return _StreamVideoState();
  }
}
class _StreamVideoState extends State<StreamVideo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(
        'Your live link');
    _videoPlayerController2 = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/480/asdasdas.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      isLive: true,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      allowedScreenSleep: false,
      allowFullScreen: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            'تأكد من اتصال الإنترنت',
            style: TextStyle(color: Colors.white),
          ),
        );
      },

      // fullScreenByDefault: true,
      // Try playing around with some of these other options:

      // showControls: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      placeholder: Container(
        color: Colors.grey,
      ),
      autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
//    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: widget.title,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
        appBar: AppBar(
        title: Center(
            child: Text(
          'Your title',
          textDirection: TextDirection.rtl,
          style: TextStyle(fontFamily: 'Tajawal',color: Colors.white,fontWeight: FontWeight.bold),
        )),
        backgroundColor: HexColor('#424242'),
      ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}