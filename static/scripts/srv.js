angular.module('Services', []).factory('User', ['$http',
	function($http) {
		return {
			get: function(s, e) {
				return $http.get('/user').then(s, e);
			},
			set: function(options, s, e) {
				return $http.put('/user', options).then(s, e);
			},
			auth: function(credentials, s, e) {
				return $http.post('/auth', credentials).then(s, e);
			}
		};
	}
])
