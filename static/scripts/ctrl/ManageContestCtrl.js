angular.module('MuscleMan').controller('ManageContestCtrl', ['$scope', '$location', 'Manager', '$routeParams',
	function($scope, $location, Manager, $routeParams) {
		var id = $routeParams.id;
		Manager.get_contest(id, function(res) {
			$scope.contest = res.data;
		}, function(res) {
			console.error(res.data);
		});
		$scope.del = function(i) {
			$scope.contest.participants.splice(i, 1);
			$scope.update_contest();
		}
		$scope.update_contest = function() {
			Manager.update_contest(id, $scope.contest, function(res) {
				alert('Saved!');
			}, function(res) {
				alert('Error! ' + res.data);
			});
		};
	}
]);
