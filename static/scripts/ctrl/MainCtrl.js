angular.module('MuscleMan').controller('MainCtrl', ['$scope', 'socket', 'User', 'LS',
	function($scope, socket, User, LS) {
		socket.on('user:online', function(data) {
			console.log('user:online');
			console.log(data);
		});

		socket.on('message:send', function(data) {
			console.log('message:send');
			console.log(data);
		});

		socket.on('photo:comment', function(data) {
			console.log('photo:comment');
			console.log(data);
			if (
				Notification.permission !== 'denied' &&
				$scope.options.user.settings.show_notifications &&
				$scope.options.user.settings.notify_photo_comments
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
				$scope.options.user.settings.show_notifications &&
				$scope.options.user.settings.notify_video_comments
			) {
				var n = new Notification('У вашего видео новый комментарий!', {
					icon: data.avatar,
					body: data.name + ' ' + data.surname + ' сказал' + data.comment
				});
				setTimeout(n.close.bind(n), 3000);
			}
		});

		$scope.message_send = function(text) {
			socket.emit('message:send', text);
		};

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
