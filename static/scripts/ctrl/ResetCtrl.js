angular.module('MuscleMan').controller('ResetCtrl', ['$scope', '$routeParams', '$location', 'User', 'MSG', 'LS',
	function($scope, $routeParams, $location, User, MSG, LS) {
		$scope.cred = {
			pass: '',
			token: $routeParams.token,
		};
		$scope.reset = function() {
			$scope.options.loading = true;
			User.reset($scope.cred, function(res) {
				console.log(res.data);
			}, function(res) {
				$scope.options.loading = false;
				MSG.err(res.data);
			});
		};
	}
]);