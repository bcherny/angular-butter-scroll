# angular-butter-scroll [![Build Status][build]](https://travis-ci.org/bcherny/angular-butter-scroll) [![Coverage Status][coverage]](https://coveralls.io/r/bcherny/angular-butter-scroll) ![][bower] [![npm]](https://www.npmjs.com/package/angular-butter-scroll)

[build]: https://img.shields.io/travis/bcherny/angular-butter-scroll.svg?branch=master&style=flat-square
[coverage]: http://img.shields.io/coveralls/bcherny/angular-butter-scroll.svg?branch=master&style=flat-square
[bower]: https://img.shields.io/bower/v/angular-butter-scroll.svg?style=flat-square
[npm]: https://img.shields.io/npm/v/angular-butter-scroll.svg?style=flat-square

![](http://www.duden.de/_media_/full/B/Butter-201100280016.jpg)

A plug and play angular directive for buttery smooth, high FPS scrolling.

### Why?

Browsers seriously optimize scroll operations, making scrolling buttery smooth by default. But if you scroll over a lot of elements with `:hover` styles, browsers have to paint and have long, unoptimized composite cycles as you scroll. These operations block the UI thread and kill FPS, making scrolly laggy and jittery.

### Install

**NPM**

`bower install angular-butter-scroll`

**Bower**

`npm install angular-butter-scroll`

### Usage

**JS**

```js
angular
.module('foo', ['turn/angularButterScroll'])
...
```

**HTML**

```html
<div angular-butter-scroll> ... </div>
```

**CSS**

```css
.disable-pointer-events * {
  pointer-events: none !important;
}
```

### How does it work?

Angular-butter-scroll works by disabling pointer events while scrolling, and re-enabling them when the user is done scrolling. It's a simple hack based on [this technique](http://www.thecssninja.com/javascript/pointer-events-60fps).

### Running the demo

Open demo/index.html in a browser

### Running the tests

```bash
bower install
npm install
grunt test
```

### Hacking it

```bash
bower install
npm install
grunt watch
```