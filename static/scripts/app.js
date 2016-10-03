angular.module('MuscleMan', ['ngFacebook', 'ngLocale', 'ngFileUpload', 'ngRoute', '720kb.datepicker', 'Services']).config(['$routeProvider', '$facebookProvider',
	function($routeProvider, $facebookProvider) {
		$routeProvider.when('/', {
			templateUrl: 'tpl/main.tpl',
			controller: 'MainCtrl'
		}).when('/auth', {
			templateUrl: 'tpl/auth.tpl',
			controller: 'AuthCtrl'
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
			redirectTo: '/auth'
		});
		$facebookProvider.setAppId('1782419512001549');
		$facebookProvider.setPermissions('public_profile,email,user_friends,user_photos,user_videos');
	}
]).run(function($rootScope) {
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//vk.com/js/api/openapi.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'vk-openapi'));
	window.vkAsyncInit = function() {
		VK.init({
			apiId: 5644041
		});
	};
});
