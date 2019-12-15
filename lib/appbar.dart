import 'package:flutter/material.dart';

class AppBarPage extends StatefulWidget {
  AppBarPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppBarPageState createState() => _AppBarPageState();
}

class SecondPage extends StatelessWidget {
  final value;
  SecondPage({Key key, @required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
      body: SafeArea(
          child: RaisedButton(
              child: Text("$value"),
              onPressed: () {
                _backCurrentPage(context);
              })),
    );
  }
}

void _backCurrentPage(BuildContext context) {
  print('执行了_backCurrentPage');
  ///只有执行了这个方法，上级页面才会收到返回的数据
  Navigator.pop(context, '我是来自SecondPage的数据');
}

class _AppBarPageState extends State<AppBarPage> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

  void openPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return SecondPage(value: 'test second page');
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {
              openPage(context);
            },
          ),
        ],
      ),
      body: const Center (
        child: Text(
          'This is the home page',
        ),
      ),
    );
  }
}