angular.module('MuscleMan').controller('AuthCtrl', ['$scope', '$location', 'User', 'LS',
	function($scope, $location, User, LS) {
		$scope.cred = {
			mail: '',
			pass: ''
		};
		$scope.auth = function() {
			if ($scope.cred.mail.$error) return;
			User.auth($scope.cred, function(res) {
				$scope.options.loading = false;
				switch (res.status) {
					case 202:
						$scope.options.user = res.data;
						LS.set('user', res.data);
						$location.path('/user');
						break;
					default:
						$location.path('/options');
						break;
				}
			}, function(res) {});
		};
	}
]);
