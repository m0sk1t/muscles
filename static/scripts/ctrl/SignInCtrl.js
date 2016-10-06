angular.module('MuscleMan').controller('SignInCtrl', ['$scope', '$location', 'socket', 'User', 'MSG', 'LS',
	function($scope, $location, socket, User, MSG, LS) {
		$scope.cred = {
			mail: '',
			pass: ''
		};
		$scope.signin = function() {
			if ($scope.cred.mail.$error) return;
			$scope.options.loading = true;
			User.signin($scope.cred, function(res) {
				console.log(res.data);
				LS.set('user', res.data);
				$scope.options.loading = false;
				$scope.options.user = res.data;
				$location.path('/user/' + $scope.options.user._id);
				socket.emit('user:online', { id: $scope.options.user._id });

			}, function(res) {
				$scope.options.loading = false;
				console.error(res);
			});
		};
	}
]);
