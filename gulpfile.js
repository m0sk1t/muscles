var gulp = require('gulp'),
	csso = require('gulp-csso'),
	rename = require('gulp-rename'),
	concat = require('gulp-concat'),
	uglify = require('gulp-uglify'),
	ngAnnotate = require('gulp-ng-annotate');

gulp.task('build_libs', function() {
	gulp.src([
		'static/libs/angular/angular.min.js',
		'static/libs/angular/locale/ngLocale.js',
		'static/libs/moment/min/moment.min.js',
		'static/libs/moment/locale/ru.js',
		'static/libs/sweetalert/dist/sweetalert.min.js',
		'static/libs/angular-route/angular-route.min.js',
		'static/libs/angular-touch/angular-touch.min.js',
		'static/libs/ng-file-upload/ng-file-upload-all.min.js',
		'static/libs/angularjs-datepicker/dist/angular-datepicker.min.js',
	])
		.pipe(concat('libs.js'))
		.pipe(ngAnnotate())
		.pipe(uglify().on('error', function(e) {
			console.log(e);
		}))
		.pipe(rename({
			extname: '.min.js'
		}))
		.pipe(gulp.dest('static/'));
});

gulp.task('build_js', function() {
	gulp.src([
		'static/scripts/app.js',
		'static/scripts/srv.js',
		'static/scripts/ctrl/*.js'
	])
		.pipe(concat('app.js'))
		.pipe(ngAnnotate())
		.pipe(uglify().on('error', function(e) {
			console.log(e);
		}))
		.pipe(rename({
			extname: '.min.js'
		}))
		.pipe(gulp.dest('static/'));
});

gulp.task('build_css', function() {
	gulp.src([
		'static/libs/angularjs-datepicker/dist/angular-datepicker.min.css',
		'static/libs/sweetalert/dist/sweetalert.css',
		'static/styles/*.css'
	])
		.pipe(concat('app.css'))
		.pipe(csso())
		.pipe(rename({
			extname: '.min.css'
		}))
		.pipe(gulp.dest('static/'));
});

gulp.task('watch', ['build_libs', 'build_js'/*, 'build_css'*/], function() {
	gulp.watch('static/scripts/*.js', ['build_js']);
	gulp.watch('static/scripts/ctrl/*.js', ['build_js']);
	//gulp.watch('static/styles/*.css', ['build_css']);
});
