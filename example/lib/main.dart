// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController horizontalController = ScrollController();
  ScrollController verticalController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            '   Vertical                    |                    Horizontal'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          // Vertically-scrolling child
          Expanded(
            child: ScrollShadow(
              scrollDirection: Axis.vertical,
              controller: verticalController,
              color: Colors.grey,
              child: ListView(
                scrollDirection: Axis.vertical,
                // ScrollController is required for Axis.horizontal
                controller: verticalController,
                children: List.generate(
                  5,
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
                  5,
                  (index) => SizedBox(
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
    );
  }
}
