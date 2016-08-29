angular.module('MuscleMan').controller('UserCtrl', ['$scope', '$location', '$routeParams', 'socket', 'User', 'MSG', 'Topic', 'Photo', 'Dialog', 'Upload',
	function($scope, $location, $routeParams, socket, User, MSG, Topic, Photo, Dialog, Upload) {
		$scope.user = {};
		$scope.photos = [];
		$scope.gallery = {
			current: null
		};

		!$scope.options.user && $location.path('/auth');

		User.load($routeParams.id, function(res) {
			$scope.user = res.data;
		}, function(res) {
			console.error(res.data);
		});

		$scope.get_age = function(birthDate) {
			var now = moment(),
				birthDate = moment(birthDate);
			return now.diff(birthDate, 'years');
		};

		$scope.birth_date = function(birthDate) {
			return moment(birthDate).format("DD-MM-YYYY");
		};

		$scope.set_current = function(index) {
			$scope.gallery.current = index;
		};
		$scope.turn_left = function() {
			$scope.gallery.current == 0 ? $scope.gallery.current = $scope.photos.length : $scope.gallery.current--;
		};
		$scope.turn_right = function() {
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

		$scope.add_photo = function() {};

		$scope.add_topic = function() {
			$scope.topic = {
				text: '',
				images: []
			};
		};

		$scope.new_topic = function() {
			Topic.new();
		};

		$scope.upload_files = function(files) {
			$scope.options.loading = true;
			if (files && files.length) {
				for (var i = 0; i < files.length; i++) {
					(function(index) {
						Upload.upload({
							url: '/photo/new',
							data: {
								file: files[index]
							}
						}).then(function(res) {
							$scope.photos.push(res.data);
							!(index < files.length) && ($scope.options.loading = false);
						});
					})(i);
				}
			}
		};

		$scope.add_comment = function(index) {
			var comment = {
				date: Date.now(),
				name: $scope.options.user.name,
				userid: $scope.options.user._id,
				comment: $scope.gallery.comment,
				avatar: $scope.options.user.avatar,
				surname: $scope.options.user.surname,
				_id: $scope.photos[$scope.gallery.current]._id,
			};
			Photo.add_comment(comment, function(res) {
				$scope.gallery.comment = '';
				$scope.photos[index].comments.push(comment);
				($routeParams.id !== $scope.options.user._id) && (comment.target = $routeParams.id, socket.emit('photo:comment', comment));
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.remove_comment = function(index, comment) {
			Photo.remove_comment({
				comment: comment,
				_id: $scope.photos[$scope.gallery.current]._id,
			}, function(res) {
				$scope.photos[index].comments = $scope.photos[index].comments.filter(function(el) {
					return !(el.userid === $scope.options.user._id && el.comment === comment);
				});
			}, function(res) {
				console.error(res.data);
			});
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
