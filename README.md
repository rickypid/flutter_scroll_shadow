#### flutter_scroll_shadow
# Scroll Shadow

[![](https://img.shields.io/static/v1?label=flutter&message=flutter_scroll_shadow&color=red??style=for-the-badge&logo=GitHub)](https://github.com/rickypid/flutter_scroll_shadow)
[![Pub Package](https://img.shields.io/pub/v/flutter_scroll_shadow.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_scroll_shadow)
[![Pub Points](https://img.shields.io/pub/points/flutter_scroll_shadow)](https://pub.dev/packages/flutter_scroll_shadow/score)
[![Pub Likes](https://img.shields.io/pub/likes/flutter_scroll_shadow)](https://pub.dev/packages/flutter_scroll_shadow/score)

[![Package Issue](https://img.shields.io/github/issues/rickypid/flutter_scroll_shadow)](https://github.com/rickypid/flutter_scroll_shadow/issues)
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
* `color`: for the shadows; default: `Colors.grey`
* `size`: The width or height of shadows, depending on `Axis`; default: `15.0`
* `child`: Scrollable child contained by the `ScrollShadow`
* `duration`: Milliseconds, as an `int,` for animation of shadow visibility changes; default: `300`
* `fadeInCurve`: The animation [Curve] to use for shadow appearance; default: `Curves.easeIn`
* `fadeOutCurve`: The animation [Curve] to use for shadow disappearance; default: `Curves.easeOut`
* `ignoreInteraction`: Determines if shadow is wrapped inside a [IgnorePointer] widget, so that all touch events with the shadow will be ignored; default: `true`

&nbsp;

## Example
![Image](https://github.com/rickypid/flutter_scroll_shadow/blob/master/doc/.media/example_vertical.png?raw=true) | ![Image](https://github.com/rickypid/flutter_scroll_shadow/blob/master/doc/.media/example_horizontal.png?raw=true)
:-:| :-:
**Vertically-scrolling child** | **Horizontally-scrolling child**

## 📚 My open source projects

### Flutter

| Package | Verison | Score | Likes | Test | Coverage |
|--|--|--|--|--|--|
| [![](https://img.shields.io/static/v1?label=flutter&message=flutter_expandable_table&color=red??style=for-the-badge&logo=GitHub)](https://github.com/rickypid/flutter_expandable_table) | [![Pub Package](https://img.shields.io/pub/v/flutter_expandable_table.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_expandable_table) | [![Pub Points](https://img.shields.io/pub/points/flutter_expandable_table)](https://pub.dev/packages/flutter_expandable_table/score) | [![Pub Likes](https://img.shields.io/pub/likes/flutter_expandable_table)](https://pub.dev/packages/flutter_expandable_table/score) |  |  |
| [![](https://img.shields.io/static/v1?label=flutter&message=widget_tree_depth_counter&color=red??style=for-the-badge&logo=GitHub)](https://github.com/rickypid/widget_tree_depth_counter) | [![Pub Package](https://img.shields.io/pub/v/widget_tree_depth_counter.svg?style=flat-square)](https://pub.dartlang.org/packages/widget_tree_depth_counter) | [![Pub Points](https://img.shields.io/pub/points/widget_tree_depth_counter)](https://pub.dev/packages/widget_tree_depth_counter/score) | [![Pub Likes](https://img.shields.io/pub/likes/widget_tree_depth_counter)](https://pub.dev/packages/widget_tree_depth_counter/score) |  |  |
| [![](https://img.shields.io/static/v1?label=flutter&message=flutter_scroll_shadow&color=red??style=for-the-badge&logo=GitHub)](https://github.com/rickypid/flutter_scroll_shadow) | [![Pub Package](https://img.shields.io/pub/v/flutter_scroll_shadow.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_scroll_shadow) | [![Pub Points](https://img.shields.io/pub/points/flutter_scroll_shadow)](https://pub.dev/packages/flutter_scroll_shadow/score) | [![Pub Likes](https://img.shields.io/pub/likes/flutter_scroll_shadow)](https://pub.dev/packages/flutter_scroll_shadow/score) |  |  |
| [![](https://img.shields.io/static/v1?label=flutter&message=flutter_bargraph&color=red??style=for-the-badge&logo=GitHub)](https://github.com/rickypid/flutter_bargraph) | [![Pub Package](https://img.shields.io/pub/v/flutter_bargraph.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_bargraph) | [![Pub Points](https://img.shields.io/pub/points/flutter_bargraph)](https://pub.dev/packages/flutter_bargraph/score) | [![Pub Likes](https://img.shields.io/pub/likes/flutter_bargraph)](https://pub.dev/packages/flutter_bargraph/score) |  |  |


### Dart

| Package | Verison | Score | Likes | Test | Coverage |
|--|--|--|--|--|--|
| [![](https://img.shields.io/static/v1?label=dart&message=cowsay&color=red??style=for-the-badge&logo=GitHub)](https://github.com/rickypid/cowsay) | [![Pub Package](https://img.shields.io/pub/v/cowsay.svg?style=flat-square)](https://pub.dartlang.org/packages/cowsay) | [![Pub Points](https://img.shields.io/pub/points/cowsay)](https://pub.dev/packages/cowsay/score) | [![Pub Likes](https://img.shields.io/pub/likes/cowsay)](https://pub.dev/packages/cowsay/score) | [![Test CI](https://github.com/rickypid/cowsay/actions/workflows/test.yml/badge.svg)](https://github.com/rickypid/cowsay/actions/workflows/test.yml) | [![codecov](https://codecov.io/gh/rickypid/cowsay/branch/master/graph/badge.svg?token=Z65KEB9SAX)](https://codecov.io/gh/rickypid/cowsay) |
| [![](https://img.shields.io/static/v1?label=dart&message=telegram_link&color=red??style=for-the-badge&logo=GitHub)](https://github.com/rickypid/telegram_link) | [![Pub Package](https://img.shields.io/pub/v/telegram_link.svg?style=flat-square)](https://pub.dartlang.org/packages/telegram_link) | [![Pub Points](https://img.shields.io/pub/points/telegram_link)](https://pub.dev/packages/telegram_link/score) | [![Pub Likes](https://img.shields.io/pub/likes/telegram_link)](https://pub.dev/packages/telegram_link/score) | [![Test CI](https://github.com/rickypid/telegram_link/actions/workflows/test.yml/badge.svg)](https://github.com/rickypid/telegram_link/actions/workflows/test.yml) | [![codecov](https://codecov.io/gh/rickypid/telegram_link/branch/main/graph/badge.svg?token=Z65KEB9SAX)](https://codecov.io/gh/rickypid/telegram_link) |