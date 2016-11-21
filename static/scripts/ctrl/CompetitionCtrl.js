angular.module('MuscleMan').controller('CompetitionCtrl', ['$scope', '$routeParams', 'User',
	function($scope, $routeParams, User) {
		$scope.competition = {};
		User.get_competition($routeParams.id, function(res) {
			$scope.competition = res.data;
		}, function(res) {
			console.error(res.data);
		});
	}
]);
