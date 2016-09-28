angular.module('MuscleMan').controller('MainCtrl', ['$scope', 'socket', 'User', 'LS',
	function($scope, socket, User, LS) {
		socket.on('user:online', function(data) {
			console.log('user:online');
			console.log(data);
		});

		socket.on('new:message', function(data) {
			console.log('new:message');
			console.log(data);
			if (
				Notification.permission !== 'denied' &&
				$scope.options.user.settings.show_notifications
			) {
				var n = new Notification('У вас новое сообщение!', {
					icon: data.avatar,
					body: data.fio + ' сказал' + data.text
				});
				setTimeout(n.close.bind(n), 3000);
			}
		});

		socket.on('photo:comment', function(data) {
			console.log('photo:comment');
			console.log(data);
			if (
				Notification.permission !== 'denied' &&
				$scope.options.user.settings.show_notifications
			) {
				var n = new Notification('У вашего фото новый комментарий!', {
					icon: data.avatar,
					body: data.name + ' ' + data.surname + ' сказал' + data.comment
				});
				setTimeout(n.close.bind(n), 3000);
			}
		});

		socket.on('video:comment', function(data) {
			console.log('video:comment');
			console.log(data);
			if (
				Notification.permission !== 'denied' &&
				$scope.options.user.settings.show_notifications
			) {
				var n = new Notification('У вашего видео новый комментарий!', {
					icon: data.avatar,
					body: data.name + ' ' + data.surname + ' сказал' + data.comment
				});
				setTimeout(n.close.bind(n), 3000);
			}
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

		$scope.$on('new_message', function(ev, data) {
			socket.emit('new:message', data);
		});

		$scope.$on('user_save', function() {
			User.set($scope.options.user, function(res) {
				LS.set('user', $scope.options.user);
				console.log('User saved!');
			}, function(res) {
				console.error(res.data);
			});
		});
	}
]);
