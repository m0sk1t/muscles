angular.module('MuscleMan').controller('AuthCtrl', ['$scope', '$location', 'socket', 'User', 'MSG', 'LS',
	function($scope, $location, socket, User, MSG, LS) {
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
						socket.emit('user:auth');
						$scope.options.user = res.data;
						$location.path('/user/' + $scope.options.user._id);
						break;
					default:
						$scope.cred.mail && MSG.custom({
								type: 'input',
								closeOnConfirm: false,
								title: 'Письмо отправлено!',
								text: 'Введите пин-код, присланный в письме',
								inputPlaceholder: "ПИН-КОД"
							},
							function(pin) {
								if (pin) {
									User.pin({
										pin: pin,
										mail: $scope.cred.mail
									}, function(res) {
										socket.emit('user:auth');
										$location.path('/options');
										MSG.ok('Добро пожаловать!');
									}, function(res) {
										switch (res.status) {
											case 403:
												swal.showInputError('Неверный пин-код, осталось попыток: ' + res.data.attempts);
												break;
											default:
												msg.err('Пин-код был введён неверно 5! раз, пожалуйста запросите заново...');
												break;
										}
									});
								}
							});
						break;
				}
			}, function(res) {
				console.error(res.data)
			});
		};
	}
]);
