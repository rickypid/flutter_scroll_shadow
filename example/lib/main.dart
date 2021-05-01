import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScrollShadow Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController horizontalController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            '   Vertical                    |                    Horizontal'),
        centerTitle: true,
      ),
      body: Container(
        child: Row(
          children: [
            // Vertically-scrolling child
            Expanded(
              child: ScrollShadow(
                color: Colors.grey,
                child: ListView(
                  children: List.generate(
                    20,
                    (index) => ListTile(title: Text('Element $index')),
                  ),
                ),
              ),
            ),

            // Horizontally-scrolling child
            Expanded(
              child: ScrollShadow(
                scrollDirection: Axis.horizontal,
                controller: horizontalController,
                color: Colors.grey,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // ScrollController is required for Axis.horizontal
                  controller: horizontalController,
                  children: List.generate(
                    20,
                    (index) => Container(
                      width: 100,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text('Element $index'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
