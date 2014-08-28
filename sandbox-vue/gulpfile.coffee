gulp = require 'gulp'
coffee = require 'gulp-coffee'
browserify = require 'gulp-browserify'

path = 'src/app.coffee'

gulp.task 'compile', ->
  gulp.src path
      .pipe coffee
        bare: true
      .pipe browserify
        insertGlobals: true
      .pipe gulp.dest('public')

gulp.task 'watch', ->
  gulp.watch path, ['compile']

gulp.task 'default', ['compile']
