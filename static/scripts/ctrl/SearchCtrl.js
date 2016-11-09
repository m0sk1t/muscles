angular.module('MuscleMan').controller('SearchCtrl', ['$scope', 'User',
	function($scope, User) {
		$scope.search = {};
		$scope.users = [];
		$scope.find_users = function() {
			if ($scope.search.fio) {
				$scope.search.name = $scope.search.fio.split(' ')[0];
				$scope.search.surname = $scope.search.fio.split(' ')[1];
			}
			User.search($scope.search, function(res) {
				$scope.users = res.data;
			}, function(res) {
				console.error(res.data);
			});
		}
	}
]);
