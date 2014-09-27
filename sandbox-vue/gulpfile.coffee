gulp = require 'gulp'
source = require 'vinyl-source-stream'
browserify = require 'browserify'
uglify = require 'gulp-uglify'
sourcemaps = require 'gulp-sourcemaps'
streamify = require 'gulp-streamify'

gulp.task 'compile', ->
  browserify
      entries: ['./src/index.coffee']
      extensions: ['.coffee', '.js']
      debug: true
    .transform 'coffeeify'
    .bundle()
    .pipe source 'bundle.js'
    .pipe sourcemaps.init
      loadMaps: true
    .pipe streamify uglify()
    .pipe sourcemaps.write()
    .pipe gulp.dest 'build'

gulp.task 'watch', ->
  gulp.watch path, ['compile']

gulp.task 'default', ['compile']
