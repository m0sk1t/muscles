angular.module('MuscleMan', ['ngFileUpload', 'ngRoute']).config(['$routeProvider',
	function($routeProvider) {
		$routeProvider.when('/', {
			controller: 'MainCtrl'
		}).when('/auth', {
			templateUrl: 'templates/auth.tpl',
			controller: 'AuthCtrl'
		}).otherwise({
			redirectTo: '/'
		});
	}
]);
