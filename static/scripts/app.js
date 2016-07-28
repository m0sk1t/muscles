angular.module('MuscleMan', ['ngFileUpload', 'ngRoute', 'Services']).config(['$routeProvider',
	function($routeProvider) {
		// Маршрутизация на стороне клиента
		$routeProvider.when('/', {
			templateUrl: 'tpl/main.tpl',
			controller: 'MainCtrl'
		}).when('/auth', {
			templateUrl: 'tpl/auth.tpl',
			controller: 'AuthCtrl'
		}).when('/album/:id', {
			templateUrl: 'tpl/album.tpl',
			controller: 'AlbumCtrl'
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
		}).when('/photos', {
			templateUrl: 'tpl/photos.tpl',
			controller: 'PhotosCtrl'
		}).when('/options', {
			templateUrl: 'tpl/options.tpl',
			controller: 'OptionsCtrl'
		}).when('/search', {
			templateUrl: 'tpl/search.tpl',
			controller: 'SearchCtrl'
		}).when('/status', {
			templateUrl: 'tpl/status.tpl',
			controller: 'StatusCtrl'
		}).when('/user', {
			templateUrl: 'tpl/user.tpl',
			controller: 'UserCtrl'
		}).otherwise({
			redirectTo: '/auth'
		});
	}
]);