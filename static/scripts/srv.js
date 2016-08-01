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
]).factory('LS', function() {
	return {
		get: function(item) {
			try {
				var item = localStorage.getItem(item);
				if (item) {
					return JSON.parse(item);
				} else {
					return null;
				}
			} catch (e) {
				console.error(e);
				return null;
			}
		},
		set: function(item, object) {
			try {
				var obj = object ? JSON.stringify(object) : '';
				localStorage.setItem(item, obj);
				return true;
			} catch (e) {
				localStorage.clear();
				console.error(e);
				return false;
			}
		}
	};
});
