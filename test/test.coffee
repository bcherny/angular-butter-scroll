describe 'angular-butter-scroll', ->

	_ = throttle: (fn) -> fn

	options =
		className: 'disable-pointer-events',
		delay: 100

	beforeEach (module 'turn/angularButterScroll'), ($provide) ->
		
		$provide.value 'angularButterScrollOptions', options
		$provide.value '_', _
	
	beforeEach ->

		inject (@$compile, $rootScope) =>

			divs = Array
			.apply null, Array 100
			.map -> '<div style="height: 100px"></div>'

			@scope = do $rootScope.$new

			@element = angular.element """
				<div angular-butter-scroll>
					#{ divs }
				</div>
			"""

	beforeEach ->

		(@$compile @element) @scope
		do @scope.$apply
		@scope = do @element.scope


	describe '#clear', ->

		it 'should remove the class defined in options.className from the element', ->

			@element.addClass options.className

			expect @element.hasClass options.className
			.toBe true

			do @scope.clear

			expect @element.hasClass options.className
			.toBe false


	describe '#scroll', ->

		it 'should add the class defined in options.className to the element', ->

			@element.removeClass options.className

			expect @element.hasClass options.className
			.toBe false

			do @scope.scroll

			expect @element.hasClass options.className
			.toBe true

		it 'should cancel the $timeout if it exists', inject ($timeout) ->

			@scope.timer = 42

			spyOn $timeout, 'cancel'

			do @scope.scroll

			do expect $timeout.cancel
			.toHaveBeenCalled

		it 'should not attempt to cancel $timeout if it does not exist', inject ($timeout) ->

			@scope.timer = null

			spyOn $timeout, 'cancel'

			do @scope.scroll

			do expect $timeout.cancel
			.not.toHaveBeenCalled

		it 'should assign a new $timeout instance to scope.timer', inject ($timeout) ->

			@scope.timer = null

			do @scope.scroll

			# duck typed $timeout detection
			expect @scope.timer.$$timeoutId
			.toBeDefined

		it 'should call #clear after options.delay has elapsed', inject ($timeout) ->

			spyOn @scope, 'clear'

			do @scope.scroll

			$timeout ->

				do expect @scope.clear
				.toHaveBeenCalled

			, options.delay