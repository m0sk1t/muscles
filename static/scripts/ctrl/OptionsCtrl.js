angular.module('MuscleMan').controller('OptionsCtrl', ['$scope', 'MSG',
	function($scope, MSG) {
		$scope.cred = {
			old_password: '',
			new_password: ''
		};

		$scope.active_page = 'profile';

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
