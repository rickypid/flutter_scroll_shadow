# flutter_scroll_shadow

[![Pub Package](https://img.shields.io/pub/v/flutter_scroll_shadow.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_scroll_shadow) [![Package Issue](https://img.shields.io/github/issues/rickypid/flutter_scroll_shadow)](https://github.com/rickypid/flutter_scroll_shadow/issues)
![Package License](https://img.shields.io/github/license/rickypid/flutter_scroll_shadow)

Scroll shadow widget for Flutter. This widget add on scroll widget a shadow, work on widget with ScrollController with vertical or horizontal orientation.

| ![Image](https://github.com/rickypid/flutter_scroll_shadow/blob/master/doc/.media/example.gif?raw=true) |
| :------------: |
| **ScrollShadow** |

## Features

* Add on scroll widget a shadow
* Vertical and Horizontal axis 
* Animation time customizable
* Shadow size customizable

## Usage

Make sure to check out [examples](https://github.com/rickypid/flutter_scroll_shadow/tree/master/exmple).

### Installation

Add the following line to `pubspec.yaml`:

```yaml
dependencies:
  flutter_scroll_shadow: ^0.1.0-alpha
```

### Basic setup

*The complete example is available [here](https://github.com/rickypid/flutter_scroll_shadow/blob/master/example/lib/main.dart).*

```dart
ScrollShadow(
  color: Colors.grey,
  child: ListView(
    children: List.generate(20, (index) => ListTile(title: Text('Element $index'),)),
  ),
);
```

### Advanced options

#### Property

* `scrollDirection` Axis, is a direction of scroll, Default: Axis.vertical
* `ScrollController` (Optional) necessary if child scroll used an external controller or scrollDirection = Axis.horizontal
* `color` is a color of shadow, Default: Colors.grey
* `size` is a size of shadow, Default: 15
* `child` The child contained by the ScrollShadow.
* `animationDuration` in milliseconds, it's duration time of animation duration on shadow visible status change

### Example

| ![Image](https://github.com/rickypid/flutter_scroll_shadow/blob/master/doc/.media/example_vertical.png?raw=true) | ![Image](https://github.com/rickypid/flutter_scroll_shadow/blob/master/doc/.media/example_horizontal.png?raw=true) |
| :------------: | :------------: |
| **Vertical axis** | **Horizontal axis** |





