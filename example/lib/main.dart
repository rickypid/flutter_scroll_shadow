import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScrollShadow',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ScrollShadow'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController controllerHorizontal = new ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Row(
          children: [
            //Vertical scroll
            Expanded(
              child: ScrollShadow(
                color: Colors.grey,
                child: ListView(
                    children: List.generate(
                        20,
                        (index) => ListTile(
                              title: Text('Element $index'),
                            ))),
              ),
            ),
            //Horizontal scroll
            Expanded(
              child: ScrollShadow(
                scrollDirection: Axis.horizontal,
                controller: controllerHorizontal,
                color: Colors.grey,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    controller: controllerHorizontal,
                    //Required with horizontal scroll direction
                    children: List.generate(
                        20,
                        (index) => Container(
                              width: 100,
                              child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Text('Element $index')),
                            ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
