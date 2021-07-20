#### flutter_scroll_shadow
# Scroll Shadow

[![Pub Package](https://img.shields.io/pub/v/flutter_scroll_shadow.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_scroll_shadow) [![Package Issue](https://img.shields.io/github/issues/rickypid/flutter_scroll_shadow)](https://github.com/rickypid/flutter_scroll_shadow/issues)
![Package License](https://img.shields.io/github/license/rickypid/flutter_scroll_shadow)

`ScrollShadow` is a widget for Flutter that adds shadows to a scrollable child.

Supports `ScrollController` and vertical or horizontal orientation.

| ![Image](https://github.com/rickypid/flutter_scroll_shadow/blob/master/doc/.media/example.gif?raw=true) |
| :------------: |
| **ScrollShadow** |

## Features
* Adds shadows over a scrollable child while not at its max extents
* Supports vertical and horizontal `Axis`
* Customizable animation duration
* Determine how wide or tall shadows render

&nbsp;

## Usage
Make sure to check out the [examples on GitHub](https://github.com/rickypid/flutter_scroll_shadow/tree/master/example).

### Installation
Add the following line to `pubspec.yaml`:
```yaml
dependencies:
  flutter_scroll_shadow: <last-release>
```

### Basic setup
*Complete example [available here](https://github.com/rickypid/flutter_scroll_shadow/blob/master/example/lib/main.dart).*

```dart
ScrollShadow(
  color: Colors.grey,
  child: ListView(
    children: List.generate(20, (index) => ListTile(title: Text('Element $index'),)),
  ),
);
```

### Properties
* `scrollDirection`: Scroll direction corresponding to child; default: `Axis.vertical`
* `controller`: Optional for vertically scrolling content, but required if the child is `Axis.horizontal`
* `color`: for the shadows; default: `Colors.grey`
* `size`: The width or height of shadows, depending on `Axis`; default: `15.0`
* `child`: Scrollable child contained by the `ScrollShadow`
* `duration`: Milliseconds, as an `int,` for animation of shadow visibility changes; default: `300`

&nbsp;

## Example
![Image](https://github.com/rickypid/flutter_scroll_shadow/blob/master/doc/.media/example_vertical.png?raw=true) | ![Image](https://github.com/rickypid/flutter_scroll_shadow/blob/master/doc/.media/example_horizontal.png?raw=true)
:-:| :-:
**Vertically-scrolling child** | **Horizontally-scrolling child**
