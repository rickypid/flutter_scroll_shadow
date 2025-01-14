import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';

const _verticalShadowSize = 40.0;
const _verticalShadowColor = Colors.pink;

const _horizontalShadowSize = 15.0;
const _horizontalShadowColor = Colors.green;

class _BothAxisShadow extends StatelessWidget {
  const _BothAxisShadow();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        // Constraint the app size to be sure to have scroll shadows
        child: SizedBox(
          height: 300,
          width: 300,
          child: ScrollShadow(
              size: _verticalShadowSize,
              color: _verticalShadowColor,
              child: ListView.builder(
                  itemBuilder: (context, rowIndex) => _MyRow(rowIndex))),
        ),
      ),
    ));
  }
}

class _MyRow extends StatelessWidget {
  _MyRow(this.rowIndex);

  final int rowIndex;
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Row $rowIndex',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            ScrollShadow(
              size: _horizontalShadowSize,
              color: _horizontalShadowColor,
              child: Scrollbar(
                scrollbarOrientation: ScrollbarOrientation.bottom,
                thumbVisibility: true,
                trackVisibility: true,
                controller: controller,
                child: SingleChildScrollView(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: List.generate(
                          20,
                          (columnIndex) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('R${rowIndex}C$columnIndex'),
                              )),
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

enum _Direction {
  start,
  end,
}

AnimatedOpacity _findVerticalShadow(_Direction direction) {
  final finder = find.byWidgetPredicate((widget) {
    if (widget is! AnimatedOpacity) return false;

    final child = widget.child;
    if (child is! Container) return false;

    if (child.constraints?.maxWidth != 40.0) return false;

    // From this point, we know that 'widget' is a shadow created by ScrollShadow
    // Every following check throw instead of just returning false

    final decoration = child.decoration as BoxDecoration;

    final gradient = decoration.gradient as LinearGradient;

    expect(gradient.begin, Alignment.bottomCenter);
    expect(gradient.end, Alignment.topCenter);

    if (const ListEquality<Color>().equals(gradient.colors,
        [_verticalShadowColor.withOpacity(0), _verticalShadowColor])) {
      return direction == _Direction.start;
    } else if (const ListEquality<Color>().equals(gradient.colors,
        [_verticalShadowColor, _verticalShadowColor.withOpacity(0)])) {
      return direction == _Direction.end;
    } else {
      fail('The gradient colors should be one of the above');
    }
  });
  final elementsFound = finder.evaluate();
  expect(elementsFound.length, 1);
  return elementsFound.first.widget as AnimatedOpacity;
}

void main() {
  testWidgets('Double axis shadow', (tester) async {
    await tester.pumpWidget(const _BothAxisShadow());
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // hitTestable guarantee the widget is visible, and not just in the widget tree
    expect(find.text('Row 0').hitTestable(), findsOneWidget);
    expect(find.text('R0C0').hitTestable(), findsOneWidget);

    // Only bottom shadow
    expect(_findVerticalShadow(_Direction.start).opacity, 0.0);
    expect(_findVerticalShadow(_Direction.end).opacity, 1.0);

    /// Scroll the first row to the right
    await tester.fling(find.text('R0C0'), const Offset(-400, 0), 500);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.text('Row 0').hitTestable(), findsOneWidget);
    expect(find.text('R0C0').hitTestable(), findsNothing);

    // Still only bottom shadow as we scroll the horizontal row
    expect(_findVerticalShadow(_Direction.start).opacity, 0.0);
    expect(_findVerticalShadow(_Direction.end).opacity, 1.0);

    /// Scroll downward
    await tester.fling(find.text('Row 0'), const Offset(0, -100), 500);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.text('Row 0').hitTestable(), findsNothing);
    expect(find.text('R0C0').hitTestable(), findsNothing);

    // Both top and bottom shadow
    expect(_findVerticalShadow(_Direction.start).opacity, 1.0);
    expect(_findVerticalShadow(_Direction.end).opacity, 1.0);
  });
}
