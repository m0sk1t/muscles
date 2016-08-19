angular.module('MuscleMan').controller('AuthCtrl', ['$scope', '$location', 'socket', 'User', 'LS',
	function($scope, $location, socket, User, LS) {
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
						LS.set('user', res.data);
						socket.emit('user:created');
						$scope.options.user = res.data;
						$location.path('/user/' + $scope.options.user._id);
						break;
					default:
						socket.emit('user:created');
						$location.path('/options');
						break;
				}
			}, function(res) {
				console.error(res.data)
			});
		};
	}
]);
