angular.module('MuscleMan').controller('ContestCtrl', ['$scope', '$routeParams', 'User',
	function($scope, $routeParams, User) {
		$scope.contest = {};
		User.get_contest($routeParams.id, function(res) {
			$scope.contest = res.data;
		}, function(res) {
			console.error(res.data);
		});
	}
]);
