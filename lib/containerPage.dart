import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  ContainerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Container'),),
      body: Container(
        width: 400.0,//设置宽
        height: 200.0,//设置高
       // color: Color(0xff0000ff),//设置颜色
        //color: Color.fromRGBO(0, 0, 0, .3),  // 设置透明色

        margin: EdgeInsets.all(30.0), // 设置

          //内间距，值为一个 EdgeInsets 对象
          padding: EdgeInsets.fromLTRB(30.0, 0, 0, 0),
          alignment: Alignment.centerLeft,
        decoration: new BoxDecoration(
          //背景填充颜色
            color: new Color(0xFFFF0000),
            //背景边框
            border: new Border.all(
              //边框颜色
                color: new Color(0xFFF0FF00),
                //边框宽度
                width: 5),
            //边框圆角
            borderRadius: new BorderRadius.only(
                topLeft: new Radius.circular(5.0),
                topRight: new Radius.circular(10.0),
                bottomLeft: new Radius.circular(15.0),
                bottomRight: new Radius.circular(20.0)),
            //渐变效果，会覆盖 color
            gradient: new LinearGradient(colors: [
              new Color(0xFFFFDEAD),
              new Color(0xFF98FB98),
              new Color(0xFF6495ED)
            ]),
            //阴影效果
            boxShadow: [new BoxShadow(color:Color(0xFFFF0000),blurRadius: 5.0)],
            //应该是背景混合模式，这个应该比较复杂，后面再研究
            backgroundBlendMode: BlendMode.color,
        ),
          //约束，这个规则貌似挺复杂的，后面详细研究
          constraints: new BoxConstraints(maxWidth: 300.0, maxHeight: 400.0),
          //形状变换，这个用得应该也比较少，可能会在做动画的时候用到，后面详细研究
          transform: new Matrix4.skewY(0.3),
          child: new Text(
            "Hello World",
            textDirection: TextDirection.ltr,
            style: new TextStyle(color: new Color(0xFFFFFFFF), fontSize: 40.0),
          ),
      ),
    );
  }
}