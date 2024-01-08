# Flutter Scroll Shadow

## [1.2.4] - 2024-01-08
#### [@pixelshot91](https://github.com/pixelshot91)
- Enable to nest mulitple ScrollShadow without the inner one interfering with the outer one

## [1.2.3] - 2023-09-04
#### [@RichiB20](https://github.com/RichiB20)/[@rickypid](https://github.com/rickypid)
- Format code, add GitHub Actions

## [1.2.2] - 2023-08-31
#### [@darkstarx](https://github.com/darkstarx)
- Get rid of the need for the scroll controller - (#8)

## [1.2.1] - 2023-08-24
#### [@RichiB20](https://github.com/RichiB20)
- Fix controller init - (#6)

## [1.2.0] - 2023-04-10
#### [@rickypid](https://github.com/rickypid)

* Update SDK version.

## [1.1.0] - 2023-01-04
#### [@rickypid](https://github.com/rickypid)
- Improved documentations.

#### [@coruscant187](https://github.com/coruscant187)
- Added `ignoreInteraction` property to `ScrollShadow` so that the shadow will be ignored from interactions while you can still interact with the widget below. Defaults to `true`.

#### [@allato](https://github.com/allato)
- Fixed invisible shadow if it doesn't need scrolling.

## [1.0.2] - 2022-01-25
#### [@rickypid](https://github.com/rickypid)
- Improved documentations.

## [1.0.1] - 2021-07-20
#### [@rickypid](https://github.com/rickypid)
- Change README.md.

## [1.0.0] - 2021-05-05
#### [@rickypid](https://github.com/rickypid)
- First stable release.

## [0.1.0-alpha.2] - 2021-04-30
#### [@Zabadam](https://github.com/zabadam)
- Added `Curve` parameter and made `duration` a full `Duration`.

## [0.1.0-alpha.1] - 2021-04-30
#### [@Zabadam](https://github.com/zabadam)
- Split package into `/src` files.
- Null safety support.
- Default `duration` increased to `300` ms (and property name shortened).
- Major simplification of visibility logic.
- Removal of `AnimationController`s and `Tween`s in favor of `AnimatedOpacity`s.
- `loc`: 231 -> 185, with added comments 👍

## [0.1.0-alpha] - 2021-04-30
#### [@rickypid](https://github.com/rickypid)
- Initial release.