module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    connect:
      site:
        options:
          base: 'htdocs'
          port: 8000

    esteWatch:
      options:
        dirs: [
          'htdocs/**/'
          'compass/**/'
          'coffee/**/'
        ]
        livereload:
          enabled: false
          port: 35729
          extensions: [
            'html'
            'css'
            'js'
          ]
      compass: (filepath) ->
        return [
          'compass'
        ]
      coffee: (filepath) ->
        return [
          'concat'
          'coffee'
        ]

    compass:
      pc:
        options:
          config: 'compass/pc/__config.rb'
      sp:
        options:
          config: 'compass/sp/__config.rb'

    concat:
      pc:
        files: [
          src: 'coffee/pc/**/*.coffee'
          dest: '.coffee/pc/main.coffee'
        ]
      sp:
        files: [
          src: 'coffee/sp/**/*.coffee'
          dest: '.coffee/sp/main.coffee'
        ]

    coffee:
      pc:
        files: [
          expand: true
          flatten: true
          cwd: '.coffee/pc/'
          src: ['*.coffee']
          dest: 'htdocs/js/'
          ext: '.js'
        ]
      sp:
        files: [
          expand: true
          flatten: true
          cwd: '.coffee/sp/'
          src: ['*.coffee']
          dest: 'htdocs/sp/js/'
          ext: '.js'
        ]

  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-este-watch'
  grunt.registerTask 'default', [
    'connect'
    'compass'
    'concat'
    'coffee'
    'esteWatch'
  ]
  return