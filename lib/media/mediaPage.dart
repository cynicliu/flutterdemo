import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:orientation/orientation.dart';
import 'package:flutter/services.dart';
import 'package:fijkplayer/fijkplayer.dart';

class MediaPage extends StatefulWidget {
  final String title;

  MediaPage({Key key, this.title}) : super(key: key);
  @override
  MediaPageState createState() {
    return MediaPageState();
  }
}

class MediaPageState extends State<MediaPage> {

  MediaPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media'),
      ),
      body: Container(
        child: MyVideo( // 这个是等会儿要编写的组件
          url: 'https://www.sample-videos.com/video123/mp4/240/big_buck_bunny_240p_1mb.mp4',
          title: '示例视频',
        ),
      ),
    );
  }
}

class MyVideo extends StatefulWidget {
  MyVideo({
    @required this.url, // 当前需要播放的地址
    this.title = '', // 视频需要显示的标题
  });

  // 视频地址
  final String url;
  // 视频标题
  final String title;

  @override
  State<MyVideo> createState() {
    return _MyVideoState();
  }
}

class _MyVideoState extends State<MyVideo> {

  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();
    player.setDataSource(widget.url, autoPlay: true);
    PlatformException e;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Fijkplayer Example")),
        body: Container(
          alignment: Alignment.center,
          child: FijkView(
            player: player,
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }
}