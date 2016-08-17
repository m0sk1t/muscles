angular.module('MuscleMan').controller('PhotosCtrl', ['$scope', '$routeParams', 'socket', 'Upload', 'Photo', 'Album', 'MSG',
	function($scope, $routeParams, socket, Upload, Photo, Album, MSG) {
		$scope.photos = [];
		$scope.options.userid = $routeParams.id;

		$scope.albums = [];
		$scope.layer = {
			editedAlbum: null,
			editedPhoto: null
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

		Album.get($routeParams.id, function(res) {
			$scope.albums = res.data;
		}, function(res) {
			console.error(res.data);
		});

		Photo.get($routeParams.id, function(res) {
			$scope.photos = res.data;
		}, function(res) {
			console.error(res.data);
		});

		$scope.createAlbum = function() {
			MSG.custom({
				type: 'input',
				closeOnConfirm: false,
				showCancelButton: true,
				cancelButtonText: 'Отмена',
				inputPlaceholder: "Название",
				text: 'Введите название альбома',
				title: 'Название'
			}, function(title) {
				if (title) {
					Album.create(title, function(res) {
						MSG.ok('Альбом создан!');
						$scope.albums.push(res.data);
					}, function(res) {
						MSG.err(res.data);
						console.error(res.data);
					});
				}
			});
		};

		$scope.edit_photo = function(opt) {
			Photo.edit(opt, function(res) {
				$scope.photos = $scope.photos.map(function(el) {
					(el._id === $scope.layer.editedPhoto._id) && (el._id = $scope.layer.editedPhoto._id);
					return el;
				});
				$scope.layer.editedPhoto = null;
				MSG.ok('Настройки фото успешно изменены!');
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.like = function(p, index) {
			var likeIndex = p.likes.indexOf($scope.options.user._id);
			if (likeIndex === -1) {
				Photo.add_like(p, function(res) {
					$scope.photos[index].likes.push($scope.options.user._id);
				}, function(res) {
					console.error(res.data);
				});
			} else {
				Photo.remove_like(p, function(res) {
					$scope.photos[index].likes.splice(likeIndex, 1);
				}, function(res) {
					console.error(res.data);
				});
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

		$scope.edit_album = function(opt) {
			Album.set_title(opt, function(res) {
				$scope.albums = $scope.albums.map(function(el) {
					(el._id === $scope.layer.editedAlbum._id) && (el._id = $scope.layer.editedAlbum._id);
					return el;
				});
				$scope.layer.editedAlbum = null;
				MSG.ok('Нименование альбома успешно изменено!');
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.delete_album = function(album) {
			Album.delete(album, function(res) {
				$scope.albums = $scope.albums.filter(function(el) {
					return el._id !== album;
				});
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.delete_photo = function(photo) {
			Photo.delete(photo, function(res) {
				$scope.photos = $scope.photos.filter(function(el) {
					return el._id !== photo;
				});
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.uploadFiles = function(files) {
			if (files && files.length) {
				for (var i = 0; i < files.length; i++) {
					Upload.upload({
						url: '/photo/new',
						data: {
							file: files[i]
						}
					}).then(function(res) {
						$scope.photos.push(res.data);
					});
				}
			}
		};
	}
]);
