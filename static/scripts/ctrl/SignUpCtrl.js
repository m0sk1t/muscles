angular.module('MuscleMan').controller('SignUpCtrl', ['$scope', '$location', 'socket', 'User', 'LS',
	function($scope, $location, socket, User, LS) {
		$scope.cred = {
			mail: '',
			pass: ''
		};
		$scope.signup = function() {
			if ($scope.cred.mail.$error) return;
			$scope.options.loading = true;
			User.signup($scope.cred, function(res) {
				LS.set('user', res.data);
				$scope.options.loading = false;
				$scope.options.user = res.data;
				$location.path('/user/' + $scope.options.user._id);
				socket.emit('user:online', { id: $scope.options.user._id });
			}, function(res) {
				console.error(res);
				$location.path('/signin');
			});
		};
	}
]);
