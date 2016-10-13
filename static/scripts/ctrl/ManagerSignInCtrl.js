angular.module('MuscleMan').controller('ManagerSignInCtrl', ['$scope', '$location', 'Manager',
	function($scope, $location, Manager) {
		$scope.cred = {
			login: '',
			password: ''
		};
		$scope.signin = function() {
			$scope.options.loading = true;
			Manager.signin($scope.cred, function(res) {
				$scope.options.loading = false;
				$scope.options.manager = res.data;
				$location.path('/manager/' + $scope.options.manager._id);
			}, function(res) {
				$scope.options.loading = false;
				console.error(res.data);
			});
		};
	}
]);
