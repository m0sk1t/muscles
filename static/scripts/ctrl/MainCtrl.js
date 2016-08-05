angular.module('MuscleMan').controller('MainCtrl', ['$scope', 'User', 'LS',
	function($scope, User, LS) {
		$scope.options = {
			user: LS.get('user') || undefined
		};
		$scope.getloc = function() {
			return location.hash === '#/';
		};
		!!$scope.options.user && User.get(function(res) {
			$scope.options.user = res.data;
			LS.set('user', res.data);
		}, function(res) {
			location.hash = '#/auth'
		});
	}
]);
