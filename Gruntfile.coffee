"use strict"
LIVERELOAD_PORT = 35729
lrSnippet = require("connect-livereload")(port: LIVERELOAD_PORT)
mountFolder = (dir) ->
  require("serve-static") require("path").resolve(dir)

module.exports = (grunt) ->
  require("time-grunt") grunt
  require("load-grunt-tasks") grunt
  grunt.loadNpmTasks "web-component-tester"

  yeomanConfig =
    app: "app"
    dist: "dist"

  grunt.initConfig
    yeoman: yeomanConfig
    watch:
      options:
        nospawn: true
        livereload:
          liveCSS: false

      livereload:
        options:
          livereload: true

        files: [
          "<%= yeoman.app %>/*.html"
          "<%= yeoman.app %>/elements/{,*/}*.html"
          "{.tmp,<%= yeoman.app %>}/elements/{,*/}*.css"
          "{.tmp,<%= yeoman.app %>}/styles/{,*/}*.css"
          "{.tmp,<%= yeoman.app %>}/scripts/{,*/}*.js"
          "<%= yeoman.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"
        ]

      js:
        files: ["<%= yeoman.app %>/scripts/{,*/}*.js"]
        tasks: ["jshint"]

      styles:
        files: [
          "<%= yeoman.app %>/styles/{,*/}*.css"
          "<%= yeoman.app %>/elements/{,*/}*.css"
        ]
        tasks: [
          "copy:styles"
          "autoprefixer:server"
        ]

      sass:
        files: [
          "<%= yeoman.app %>/styles/{,*/}*.{scss,sass}"
          "<%= yeoman.app %>/elements/{,*/}*.{scss,sass}"
        ]
        tasks: [
          "sass:server"
          "autoprefixer:server"
        ]

    sass:
      options:
        loadPath: "bower_components"

      dist:
        options:
          style: "compressed"

        files: [
          expand: true
          cwd: "<%= yeoman.app %>"
          src: [
            "styles/{,*/}*.{scss,sass}"
            "elements/{,*/}*.{scss,sass}"
          ]
          dest: "<%= yeoman.dist %>"
          ext: ".css"
        ]

      server:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>"
          src: [
            "styles/{,*/}*.{scss,sass}"
            "elements/{,*/}*.{scss,sass}"
          ]
          dest: ".tmp"
          ext: ".css"
        ]

    autoprefixer:
      options:
        browsers: ["last 2 versions"]

      server:
        files: [
          expand: true
          cwd: ".tmp"
          src: "**/*.css"
          dest: ".tmp"
        ]

      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.dist %>"
          src: [
            "**/*.css"
            "!bower_components/**/*.css"
          ]
          dest: "<%= yeoman.dist %>"
        ]

    connect:
      options:
        port: 9000

        # change this to '0.0.0.0' to access the server from outside
        hostname: "localhost"

      livereload:
        options:
          middleware: ->
            [
              lrSnippet
              mountFolder(".tmp")
              mountFolder(yeomanConfig.app)
            ]

      test:
        options:
          open:
            target: "http://localhost:<%= connect.options.port %>/test"

          middleware: ->
            [
              mountFolder(".tmp")
              mountFolder(yeomanConfig.app)
            ]

          keepalive: true

      dist:
        options:
          middleware: ->
            [mountFolder(yeomanConfig.dist)]

    open:
      server:
        path: "http://localhost:<%= connect.options.port %>"

    clean:
      dist: [
        ".tmp"
        "<%= yeoman.dist %>/*"
      ]
      server: ".tmp"

    jshint:
      options:
        jshintrc: ".jshintrc"
        reporter: require("jshint-stylish")

      all: [
        "<%= yeoman.app %>/scripts/{,*/}*.js"
        "!<%= yeoman.app %>/scripts/vendor/*"
        "test/spec/{,*/}*.js"
      ]

    useminPrepare:
      html: "<%= yeoman.app %>/index.html"
      options:
        dest: "<%= yeoman.dist %>"

    usemin:
      html: ["<%= yeoman.dist %>/{,*/}*.html"]
      css: ["<%= yeoman.dist %>/styles/{,*/}*.css"]
      options:
        dirs: ["<%= yeoman.dist %>"]
        blockReplacements:
          vulcanized: (block) ->
            "<link rel=\"import\" href=\"" + block.dest + "\">"

    vulcanize:
      default:
        options:
          strip: true

        files:
          "<%= yeoman.dist %>/elements/elements.vulcanized.html": ["<%= yeoman.dist %>/elements/elements.html"]

    imagemin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/images"
          src: "{,*/}*.{png,jpg,jpeg,svg}"
          dest: "<%= yeoman.dist %>/images"
        ]

    minifyHtml:
      options:
        quotes: true
        empty: true
        spare: true

      app:
        files: [
          expand: true
          cwd: "<%= yeoman.dist %>"
          src: "*.html"
          dest: "<%= yeoman.dist %>"
        ]

    copy:
      dist:
        files: [
          expand: true
          dot: true
          cwd: "<%= yeoman.app %>"
          dest: "<%= yeoman.dist %>"
          src: [
            "*.{ico,txt}"
            ".htaccess"
            "*.html"
            "elements/**"
            "!elements/**/*.scss"
            "images/{,*/}*.{webp,gif}"
            "bower_components/**"
          ]
        ]

      styles:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>"
          dest: ".tmp"
          src: ["{styles,elements}/{,*/}*.css"]
        ]

    "wct-test":
      options:
        root: "<%= yeoman.app %>"
        plugins:
          serveStatic:
            middleware: ->
              mountFolder ".tmp"

      local:
        options:
          remote: false

      remote:
        options:
          remote: true

    # See this tutorial if you'd like to run PageSpeed
    # against localhost: http://www.jamescryer.com/2014/06/12/grunt-pagespeed-and-ngrok-locally-testing/
    pagespeed:
      options:

        # By default, we use the PageSpeed Insights
        # free (no API key) tier. You can use a Google
        # Developer API key if you have one. See
        # http://goo.gl/RkN0vE for info
        nokey: true

      # Update `url` below to the public URL for your site
      mobile:
        options:
          url: "https://developers.google.com/web/fundamentals/"
          locale: "en_GB"
          strategy: "mobile"
          threshold: 80

  ##
  ## TASKS
  ##

  grunt.registerTask "serve", (target) ->
    if target is "dist"
      return grunt.task.run([
        "build"
        "open"
        "connect:dist:keepalive"
      ])
    grunt.task.run [
      "clean:server"
      "sass:server"
      "copy:styles"
      "autoprefixer:server"
      "connect:livereload"
      "open"
      "watch"
    ]
    return

  grunt.registerTask "test", ["wct-test:local"]

  grunt.registerTask "test:browser", ["connect:test"]

  grunt.registerTask "test:remote", ["wct-test:remote"]

  grunt.registerTask "build", [
    "clean:dist"
    "sass"
    "copy"
    "useminPrepare"
    "imagemin"
    "concat"
    "autoprefixer"
    "uglify"
    "vulcanize"
    "usemin"
    "minifyHtml"
  ]

  grunt.registerTask "default", [
    "jshint"
    # 'test'
    "build"
  ]

  return


