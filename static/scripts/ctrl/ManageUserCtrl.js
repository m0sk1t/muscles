angular.module('MuscleMan').controller('ManageUserCtrl', ['$scope', 'User', 'Manager', '$routeParams',
	function($scope, User, Manager, $routeParams) {
		User.load($routeParams.id, function(res) {
			$scope.user = res.data;
		}, function(res) {
			console.error(res.data);
		});
		$scope.del_wp = function(i) {
			$scope.user.workplaces.splice(i, 1);
			$scope.update_user();
		};
		$scope.del_ac = function(i) {
			$scope.user.achievements.splice(i, 1);
			$scope.update_user();
		};
		$scope.del_un = function(i) {
			$scope.user.universities.splice(i, 1);
			$scope.update_user();
		};
		$scope.update_user = function() {
			Manager.update_user($routeParams.id, $scope.user, function(res) {
				$scope.user = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};
	}
]);
