angular.module('MuscleMan').controller('AlbumCtrl', ['$scope', '$routeParams', 'Photo', 'Album', 'MSG',
	function($scope, $routeParams, Photo, Album, MSG) {
		$scope.album = {};
		$scope.photos = [];

		$scope.gallery = {
			current_photo: null
		};

		$scope.layer = {
			editedAlbum: null,
			editedPhoto: null
		};

		$scope.manage_photo_keypress = function(ev) {
			var btn = {
				ESCAPE: 27,
				RIGHT: 39,
				LEFT: 37,
			};
			switch (ev.keyCode) {
				case btn.ESCAPE:
					$scope.gallery.current_photo = null;
					break;
				case btn.RIGHT:
					$scope.turn_photo_right();
					break;
				case btn.LEFT:
					$scope.turn_photo_left();
					break;
			}
		};

		$scope.getDate = function(date) {
			return moment(date).format('DD.MM.YYYY');
		};

		$scope.turn_photo_left = function() {
			$scope.gallery.current_photo === 0 ? $scope.gallery.current_photo = $scope.photos.length : $scope.gallery.current_photo--;
		};
		$scope.turn_photo_right = function() {
			$scope.gallery.current_photo === $scope.photos.length - 1 ? $scope.gallery.current_photo = 0 : $scope.gallery.current_photo++;
		};

		$scope.edit_album = function(opt) {
			Album.set_title(opt, function(res) {
				$scope.album.title = opt.title;
				$scope.layer.editedAlbum = null;
				MSG.ok('Наименование альбома успешно изменено!');
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.set_album_cover = function(opt) {
			opt._id = $scope.album._id;
			opt.title = $scope.album.title;
			Album.set_title(opt, function(res) {
				$scope.album.cover = opt.title;
				$scope.layer.editedAlbum = null;
				MSG.ok('Обложка альбома успешно изменена!');
			}, function(res) {
				console.error(res.data);
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

		$scope.like_photo = function() {
			var likeIndex = $scope.photos[$scope.gallery.current_photo].likes.indexOf($scope.options.user._id);
			if (likeIndex === -1) {
				Photo.add_like($scope.photos[$scope.gallery.current_photo], function(res) {
					$scope.photos[$scope.gallery.current_photo].likes.push($scope.options.user._id);
				}, function(res) {
					console.error(res.data);
				});
			} else {
				Photo.remove_like($scope.photos[$scope.gallery.current_photo], function(res) {
					$scope.photos[$scope.gallery.current_photo].likes.splice(likeIndex, 1);
				}, function(res) {
					console.error(res.data);
				});
			}
		};

		$scope.add_photo_comment = function() {
			if (!$scope.gallery.comment) return;
			var comment = {
				date: Date.now(),
				name: $scope.options.user.name,
				userid: $scope.options.user._id,
				comment: $scope.gallery.comment,
				avatar: $scope.options.user.avatar,
				surname: $scope.options.user.surname,
				_id: $scope.photos[$scope.gallery.current_photo]._id,
			};
			Photo.add_comment(comment, function(res) {
				$scope.gallery.comment = '';
				$scope.photos[$scope.gallery.current_photo].comments.push(comment);
				($routeParams.id !== $scope.options.user._id) && (comment.target = $routeParams.id, socket.emit('photo:comment', comment));
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.remove_photo_comment = function(comment) {
			Photo.remove_comment({
				comment: comment,
				_id: $scope.photos[$scope.gallery.current_photo]._id,
			}, function(res) {
				$scope.photos[$scope.gallery.current_photo].comments = $scope.photos[$scope.gallery.current_photo].comments.filter(function(el) {
					return !(el.userid === $scope.options.user._id && el.comment === comment);
				});
			}, function(res) {
				console.error(res.data);
			});
		};

		Photo.get($routeParams.userid, function(res) {
			$scope.photos = res.data.filter(function(el) {
				return el.album === $routeParams.id;
			});
		}, function(res) {
			console.error(res.data);
		});

		Album.get_one($routeParams.id, function(res) {
			$scope.album = res.data;
		}, function(res) {
			console.error(res.data);
		});
	}
]);