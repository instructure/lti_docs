#global module:false

"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-exec"

  grunt.initConfig

    copy:
      jquery:
        files: [{
          expand: true
          cwd: "bower_components/jquery/dist/"
          src: "jquery.min.js"
          dest: "vendor/js/"
        }]
      bootstrap:
        files: [{
          expand: true
          cwd: "bower_components/bootstrap/dist/css/"
          src: "bootstrap.min.css"
          dest: "vendor/css/"
        },
          {
            expand: true
            cwd: "bower_components/bootstrap/dist/js/"
            src: "bootstrap.min.js"
            dest: "vendor/js/"
          }]

    exec:
      jekyll:
        cmd: "jekyll build --trace"

      jekyll_local:
        cmd: "jekyll build --trace --config _config.local.yml"

    watch:
      options:
        livereload: true
      source:
        files: [
          "_drafts/**/*"
          "_includes/**/*"
          "_layouts/**/*"
          "_posts/**/*"
          "css/**/*"
          "js/**/*"
          "_config.yml"
          "*.html"
          "*.md"
        ]
        tasks: [
          "exec:jekyll_local"
        ]

    connect:
      server:
        options:
          port: 4000
          base: '_site'
          livereload: true

  grunt.registerTask "build", [
    "copy"
    "exec:jekyll"
  ]

  grunt.registerTask "serve", [
    "copy"
    "local_config"
    "exec:jekyll_local"
    "connect:server"
    "watch"
  ]

  grunt.registerTask 'local_config', 'create a local config file', ->
    YAML = require 'yamljs'
    conf = grunt.file.readYAML '_config.yml'
    conf['baseurl'] = ''
    grunt.file.write '_config.local.yml', YAML.stringify(conf)


  grunt.registerTask "default", [
    "serve"
  ]