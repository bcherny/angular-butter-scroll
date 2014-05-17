angular.module('turn/angularButterScroll', []).value('angularButterScrollOptions', {
  className: 'disable-pointer-events',
  delay: 100
}).directive('angularButterScroll', [
  '$window',
  '$timeout',
  'angularButterScrollOptions',
  function ($window, $timeout, angularButterScrollOptions) {
    var options = angularButterScrollOptions;
    return {
      restrict: 'A',
      link: function (scope, element) {
        angular.extend(scope, {
          timer: null,
          clear: function () {
            element.removeClass(options.className);
          },
          scroll: _.throttle(function () {
            element.addClass(options.className);
            if (scope.timer) {
              $timeout.cancel(scope.timer);
            }
            scope.timer = $timeout(scope.clear, options.delay);
          }, options.delay)
        });
        $window.addEventListener('scroll', scope.scroll, false);
      }
    };
  }
]);