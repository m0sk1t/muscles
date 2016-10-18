angular.module('MuscleMan').controller('ManageContestCtrl', ['$scope', '$location', 'Manager', '$routeParams',
	function($scope, $location, Manager, $routeParams) {
		Manager.get_contest($routeParams.id, function(res) {
			$scope.contest = res.data;
		}, function(res) {
			console.error(res.data);
		});
		$scope.del = function(i) {
			$scope.contest.participants.splice(i, 1);
			$scope.update_contest();
		}
		$scope.update_contest = function() {
			Manager.update_contest($routeParams.id, $scope.contest, function(res) {
				window.history.back();
			}, function(res) {
				console.error(res.data);
			});
		};
	}
]);
