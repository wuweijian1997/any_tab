import 'package:flutter/material.dart';
import 'page/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildItem('CircularAnyTab', CircularAnyTabPage()),
          buildItem('FragmentsAnyTab', FragmentsAnyTabPage()),
          buildItem('SizeAnyTab', SizeAnyTabPage()),
        ],
      ),
    );
  }

  Widget buildItem(String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return page;
        }));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        color: Colors.blue,
        width: double.infinity,
        alignment: Alignment.center,
        height: 100,
        child: Text(title, style: TextStyle(fontSize: 36),),
      ),
    );
  }
}
