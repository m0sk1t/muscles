angular.module('MuscleMan').controller('UserCtrl', ['$scope', '$location', '$routeParams', 'User', 'MSG', 'Photo', 'Dialog',
	function($scope, $location, $routeParams, User, MSG, Photo, Dialog) {
		$scope.user = {};
		$scope.photos = [];

		User.load($routeParams.id, function(res) {
			$scope.user = res.data;
		}, function(res) {
			console.error(res.data);
		});

		!$scope.options.user && $location.path('/auth');

		$scope.getAge = function(birthDate) {
			var now = moment(),
				birthDate = moment(birthDate);
			return now.diff(birthDate, 'years');
		};

		$scope.birthDate = function(birthDate) {
			return moment(birthDate).format("DD-MM-YYYY");
		};

		$scope.gallery = {
			current: null
		};

		$scope.turnLeft = function() {
			$scope.gallery.current == 0 ? $scope.gallery.current = $scope.photos.length : $scope.gallery.current--;
		};
		$scope.turnRight = function() {
			$scope.gallery.current == $scope.photos.length - 1 ? $scope.gallery.current = 0 : $scope.gallery.current++;
		};

		Photo.get($routeParams.id, function(res) {
			$scope.photos = res.data;
		}, function(res) {
			console.error(res.data);
		});

		$scope.user_save = function() {
			$scope.$emit('user_save');
		};

		$scope.send_message = function(data) {
			$scope.$emit('new_message', data);
		};

		$scope.write_message = function() {
			MSG.custom({
				title: "Новое сообщение!",
				text: 'Введите текст сообщения',
				type: 'input',
				showCancelButton: true,
				closeOnConfirm: true,
			}, function(text) {
				if (text) {
					var dlg = {
							addressee: {
								id: $scope.user._id,
								avatar: $scope.user.avatar,
								fio: $scope.user.name + ' ' + $scope.user.surname,
							},
							message: {
								text: text,
								t: Date.now(),
								uid: $scope.options.user._id,
							}
						},
						msg = {
							message: text,
							target: $scope.user._id,
							avatar: $scope.options.user.avatar,
							fio: $scope.options.user.name + ' ' + $scope.options.user.surname,
						};
					Dialog.check($scope.user._id, function(res) {
						Dialog.add_message(res.data._id, {
							addressee: $scope.user._id,
							message: dlg.message,
						}, function(res) {
							$scope.send_message(msg);
							$location.path('/dialogs');
						}, function(res) {
							console.error(res.data);
						});
					}, function(res) {
						Dialog.create(dlg, function(res) {
							$scope.send_message(msg);
							$location.path('/dialogs');
						}, function(res) {
							console.error(res.data);
						});
					});
				} else {
					swal.showInputError('Введите хоть что-нибудь...');
				}
			})
		}
	}
]);
