angular.module('MuscleMan', ['ngLocale', 'ngFileUpload', 'ngRoute', '720kb.datepicker', 'Services']).config(['$routeProvider', /*'$facebookProvider',*/

    function($routeProvider) {
        $routeProvider.when('/', {
            templateUrl: 'tpl/main.tpl',
            controller: 'MainCtrl'
        }).when('/signup', {
            templateUrl: 'tpl/signup.tpl',
            controller: 'SignUpCtrl'
        }).when('/signin', {
            templateUrl: 'tpl/signin.tpl',
            controller: 'SignInCtrl'
        }).when('/user/:userid/album/:id', {
            templateUrl: 'tpl/album.tpl',
            controller: 'AlbumCtrl'
        }).when('/hobbies', {
            templateUrl: 'tpl/hobbies.tpl',
            controller: 'HobbiesCtrl'
        }).when('/articles', {
            templateUrl: 'tpl/articles.tpl',
            controller: 'ArticlesCtrl'
        }).when('/article/:id', {
            templateUrl: 'tpl/article.tpl',
            controller: 'ArticleCtrl'
        }).when('/competitions', {
            templateUrl: 'tpl/competitions.tpl',
            controller: 'CompetitionsCtrl'
        }).when('/competition/:id', {
            templateUrl: 'tpl/competition.tpl',
            controller: 'CompetitionCtrl'
        }).when('/contests', {
            templateUrl: 'tpl/contests.tpl',
            controller: 'ContestsCtrl'
        }).when('/contest/:id', {
            templateUrl: 'tpl/contest.tpl',
            controller: 'ContestCtrl'
        }).when('/dialogs', {
            templateUrl: 'tpl/dialogs.tpl',
            controller: 'DialogsCtrl'
        }).when('/favs', {
            templateUrl: 'tpl/favs.tpl',
            controller: 'FavsCtrl'
        }).when('/user/:id/photos/:photoid', {
            templateUrl: 'tpl/photos.tpl',
            controller: 'PhotosCtrl'
        }).when('/user/:id/videos/:videoid', {
            templateUrl: 'tpl/videos.tpl',
            controller: 'VideosCtrl'
        }).when('/options', {
            templateUrl: 'tpl/options.tpl',
            controller: 'OptionsCtrl'
        }).when('/search', {
            templateUrl: 'tpl/search.tpl',
            controller: 'SearchCtrl'
        }).when('/status', {
            templateUrl: 'tpl/status.tpl',
            controller: 'StatusCtrl'
        }).when('/user/:id', {
            templateUrl: 'tpl/user.tpl',
            controller: 'UserCtrl'
        }).otherwise({
            redirectTo: '/'
        });
    }
]).run(function($rootScope) {
    console.log('App loaded!');
});
