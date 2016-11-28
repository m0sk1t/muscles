angular.module('MuscleMan').controller('CompetitionsCtrl', ['$scope', 'User',
	function($scope, User) {
		$scope.eventSources = { url: '/competition/all' };
		/*
				$scope.competitions = [];
				User.get_competition('all', function(res) {
					$scope.competitions = res.data;
					$scope.eventSources.events = $scope.competitions;
				}, function(res) {
					console.error(res.data);
				});
		*/
	}
]);
