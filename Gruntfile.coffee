module.exports = (grunt) ->

	[
		'grunt-contrib-coffee'
		'grunt-contrib-jasmine'
		'grunt-contrib-watch'
		'grunt-ngmin'
	].forEach grunt.loadNpmTasks

	# task sets
	build = ['ngmin']
	test = ['html2js', 'coffee', 'jasmine']

	# task defs
	grunt.initConfig

		pkg: grunt.file.readJSON 'package.json'

		coffee:
			files:
				'test/test.js': 'test/test.coffee'

		jasmine:
			test:
				src: './src/<%= pkg.name %>.js'
				options:
					specs: './test/test.js'
					vendor: [
						'./bower_components/jquery/dist/jquery.js'
						'./bower_components/angular/angular.js'
						'./bower_components/angular-mocks/angular-mocks.js'
						'./dist/template.js'
					]
					keepRunner: true

		ngmin:
			main:
				src: ['./src/<%= pkg.name %>.js']
				dest: './dist/<%= pkg.name %>.js'

		watch:
			main:
				files: './src/*'
				tasks: build
				options:
					interrupt: true
					spawn: false
			test:
				files: './test/*.js'
				tasks: test
				options:
					interrupt: true
					spawn: false

	grunt.registerTask 'default', build
	grunt.registerTask 'test', test