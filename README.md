angular-butter-scroll
=====================

![butta](http://www.duden.de/_media_/full/B/Butter-201100280016.jpg)

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

It works by disabling pointer events while scrolling, and re-enabling them when the user is done scrolling. It's a simple hack based on [the technique](http://www.thecssninja.com/javascript/pointer-events-60fps).

### Running the demo

Open demo/index.html in a browser

### Running the tests

```bash
bower install
npm install
grunt test
```

### Hacking on it

```bash
bower install
npm install
grunt watch
```