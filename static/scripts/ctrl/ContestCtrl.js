angular.module('MuscleMan').controller('ContestCtrl', ['$scope', '$routeParams', 'User',
	function($scope, $routeParams, User) {
		$scope.contest = {};
		User.get_contest($routeParams.id, function(res) {
			$scope.contest = res.data;
			$scope.get_contest_participants();
		}, function(res) {
			console.error(res.data);
		});
		$scope.get_contest_participants = function() {
			User.get_contest_participants($routeParams.id, function(res) {
				$scope.participants = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};
		$scope.participate = function() {
			var index = $scope.contest.participants.indexOf($scope.options.user._id);
			if (index === -1) {
				User.add_contest_participant($routeParams.id, function(res) {
					$scope.contest.participants.push($scope.options.user._id);
					$scope.get_contest_participants();
				}, function(res) {
					console.error(res.data);
				});
			} else {
				User.rm_contest_participant($routeParams.id, function(res) {
					$scope.contest.participants.splice(index, 1);
					$scope.get_contest_participants();
				}, function(res) {
					console.error(res.data);
				});
			}
		};
	}
]);
