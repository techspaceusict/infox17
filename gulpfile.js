var gulp = require('gulp'),
	uglify = require('gulp-uglify'),
	cleanCSS = require('gulp-clean-css');

gulp.task('default', function() {

  gulp.src('public1/stylesheets/**/*.css') 
  	.pipe(gulp.dest('public/css'));
  gulp.src('public1/javascripts/**/*.js')
  	.pipe(uglify())
  	.pipe(gulp.dest('build/js'));	
});
