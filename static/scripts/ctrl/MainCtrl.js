angular.module('MuscleMan').controller('MainCtrl', ['$scope', 'LS',
	function($scope, LS) {
		$scope.options = {
			user: LS.get('user')
		};
		$scope.getloc = function() {
			return location.hash === '#/';
		};
	}
]);
