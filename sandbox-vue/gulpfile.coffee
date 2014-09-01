gulp = require 'gulp'
coffee = require 'gulp-coffee'
source = require 'vinyl-source-stream'
browserify = require 'browserify'
exorcist = require 'exorcist'

sourcemaps = require 'gulp-sourcemaps'

path = 'src/app.coffee'

gulp.task 'compile', ->
  browserify
      entries: ['./src/app.coffee']
      extensions: ['.coffee','.jade', '.js']
      debug: true
    .transform 'coffeeify'
    .bundle()
    .pipe exorcist 'public/bundle.js.map'
    .pipe source 'bundle.js'
    .pipe gulp.dest 'public'

gulp.task 'watch', ->
  gulp.watch path, ['compile']

gulp.task 'default', ['compile']
