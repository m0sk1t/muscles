angular.module('MuscleMan').controller('MainCtrl', ['$scope',
	function($scope) {
		$scope.getloc = function() {
			return location.hash === '#/';
		};
		$scope.options = {};
	}
]);
