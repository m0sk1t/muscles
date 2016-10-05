angular.module('MuscleMan').controller('OptionsCtrl', ['$scope', 'MSG', 'Upload', 'User',
	function($scope, MSG, Upload, User) {
		$scope.cred = {
			old_password: '',
			new_password: ''
		};

		User.get(function(res) {
			$scope.options.user = res.data;
			LS.set('user', res.data);
		}, function(res) {
			location.hash = '#/auth'
		});

		$scope.active_page = 'profile';

		$scope.upload_photo = function(photo) {
			console.log(photo);
			$scope.options.loading = true;
			$scope.fileName = photo.name;
			if (photo) {
				Upload.upload({
					url: '/photo/new',
					data: {
						file: photo
					}
				}).then(function(res) {
					console.log('$scope.options.user:', $scope.options.user);
					console.log('res.data.image:', res.data.image);
					$scope.options.user.avatar = res.data.image;
					$scope.options.loading = false;
					$scope.fileName = null;
					$scope.user_save();
				});
			} else {
				$scope.options.loading = false;
				return;
			}

		};

		$scope.request_permissions = function() {
			if (!("Notification" in window)) {;
				MSG.err('Ваш браузер не поддерживает уведомления...');
				return;
			} else if (Notification.permission !== 'denied') {
				Notification.requestPermission(function(permission) {
					if (permission === "granted") {
						var notification = new Notification("Отлично! Вы разрешили нам уведомлять вас о новых событиях!");
					}
					if (permission === "denied") {
						MSG.info('Вы не сможете получать уведомления о новых событиях...');
					}
				});
			}
		};
		$scope.user_save = function() {
			$scope.$emit('user_save');
		};
	}
]);
