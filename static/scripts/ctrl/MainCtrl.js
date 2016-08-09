angular.module('MuscleMan').controller('MainCtrl', ['$scope', 'User', 'LS',
	function($scope, User, LS) {
		var socket = io();

		socket.on('user:online', function(ev, data) {
			console.log('user:online');
		});

		$scope.options = {
			user: LS.get('user') || 0
		};

		$scope.getloc = function() {
			return location.hash === '#/';
		};

		!!$scope.options.user && User.get(function(res) {
			$scope.options.user = res.data;
			LS.set('user', res.data);
		}, function(res) {
			location.hash = '#/auth'
		});

		$scope.$on('user_save', function() {
			User.set($scope.options.user, function(res) {
				LS.set('user', $scope.options.user);
				console.log('User saved!');
			}, function(res) {
				console.error(res.data);
			});
		})
	}
]);
