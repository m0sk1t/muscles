module.exports = function (grunt) {

    grunt.config.init({
        pkg: grunt.file.readJSON('package.json'),

        stylus: {
            styles: {
                files: {
                    'static/tmp/styles.css': ['static/blocks/styles.styl']
                },
                options: {
                    import: ['nib'],
                    use: [
                        require('jeet'),
                        require('rupture')
                    ],
                     paths: [
                        './node_modules/rupture',
                        './node_modules/jeet/stylus'
                    ],
                }
            }
        },

        concat: {

            styles: {
                options: {
                    separator: '',
                },
                src: ['static/libs/sweetalert/dist/sweetalert.css', 'static/tmp/styles.css', 'static/libs/angularjs-datepicker/dist/angular-datepicker.min.css', 'static/blocks/project/calendar/calendar.css'],
                dest: 'static/tmp/styles-merged.css'
            }
        },

        cssmin: {
            styles: {
                src: 'static/tmp/styles-merged.css',
                dest: 'static/app.min.css'
            }
        },

        watch: {
            styles: {
                files: ['static/blocks/**/*.styl'],
                tasks: ['styles'],
                options: {
                    spawn: false,
                    livereload: true
                }
            },
        },

        clean: ["static/tmp"]
    });

    grunt.loadNpmTasks('grunt-contrib-stylus');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-clean');

    grunt.registerTask('styles', 'Build and minify css files', ['stylus', 'concat', 'cssmin', 'clean']);

    grunt.registerTask('default', ['styles']);
}
