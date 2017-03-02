angular.module('MuscleMan').controller('ForgotCtrl', ['$scope', '$location', 'User', 'MSG', 'LS',
	function($scope, $location, User, MSG, LS) {
		$scope.cred = {
			mail: '',
		};
		$scope.forgot = function() {
			if ($scope.cred.mail.$error) return;
			$scope.options.loading = true;
			User.forgot($scope.cred, function(res) {
				$scope.options.loading = false;
				MSG.ok(res.data);
			}, function(res) {
				$scope.options.loading = false;
				MSG.err(res.data);
			});
		};
	}
]);