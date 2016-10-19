angular.module('MuscleMan').controller('ManageCompetitionCtrl', ['$scope', '$location', 'Manager', '$routeParams',
	function($scope, $location, Manager, $routeParams) {
		Manager.get_competition($routeParams.id, function(res) {
			$scope.competition = res.data;
		}, function(res) {
			console.error(res.data);
		});
		$scope.update_competition = function() {
			Manager.update_competition($routeParams.id, $scope.competition, function(res) {
				window.history.back();
			}, function(res) {
				console.error(res.data);
			});
		};
	}
]);
