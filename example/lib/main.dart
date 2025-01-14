// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'ScrollShadow Example',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            '   Vertical                    |                    Horizontal',
          ),
          centerTitle: true,
        ),
        body: Row(
          children: [
            // Vertically-scrolling child
            Expanded(
              child: ScrollShadow(
                color: Colors.grey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(
                    15,
                    (index) => ListTile(title: Text('Element $index')),
                  ),
                ),
              ),
            ),

            // Horizontally-scrolling child
            Expanded(
              child: ScrollShadow(
                color: Colors.grey,
                child: ListView(
                  scrollDirection: Axis.horizontal,
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
