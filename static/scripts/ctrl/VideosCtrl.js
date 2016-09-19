angular.module('MuscleMan').controller('VideosCtrl', ['$sce', '$http', '$scope', '$routeParams', 'Video', 'socket', 'MSG',
	function($sce, $http, $scope, $routeParams, Video, socket, MSG) {
		$scope.videos = [];

		$scope.layer = {
			addVideo: null,
			editedVideo: null,
		};

		$scope.gallery = {
			current: null,
		};

		$scope.options.userid = $routeParams.id;

		Video.get($routeParams.id, function(res) {
			$scope.videos = res.data;
			$routeParams.videoid !== 'all' && $scope.videos.map(function(el, i) {
				if (el._id === $routeParams.videoid) {
					$scope.gallery.current = i;
				}
			});
		}, function(res) {
			console.error(res.data);
		});

		$scope.get_vimeo_preview = function(id) {
			$http.get('https://vimeo.com/api/oembed.json?url=https%3A//vimeo.com/' + id).then(function(res) {
				console.log(res.data.thumbnail_url);
			}, function(res) {
				console.error(res.data);
			});
			return 0;
		};

		$scope.include_video = function(type, id) {
			switch (type) {
				case 'vimeo':
					return $sce.trustAsResourceUrl('https://player.vimeo.com/video/' + id + '?title=0&byline=0&portrait=0');
					break;
				case 'youtube':
					return $sce.trustAsResourceUrl('https://www.youtube.com/embed/' + id + '?wmode=transparent');
					break;
			}
		};

		$scope.turn_left = function() {
			$scope.gallery.current == 0 ? $scope.gallery.current = $scopvide.length : $scope.gallery.current--;
		};

		$scope.turn_right = function() {
			$scope.gallery.current == $scope.videos.length - 1 ? $scope.gallery.current = 0 : $scope.gallery.current++;
		};

		$scope.add_video = function() {
			var video = {
					title: $scope.layer.addVideo.title,
				},
				link = $scope.layer.addVideo.link.trim();
			switch (true) {
				case link.indexOf('https://www.youtube.com/watch?v=') === 0:
					video.type = 'youtube';
					video.link = link.split('https://www.youtube.com/watch?v=')[1];
					break;
				case link.indexOf('https://www.youtu.be/') === 0:
					video.type = 'youtube';
					video.link = link.split('https://www.youtu.be/')[1];
					break;
				case link.indexOf('https://vimeo.com/') === 0:
					video.type = 'vimeo';
					video.link = link.split('https://vimeo.com/')[1];
					break;
				default:
					MSG.err('Даннный тип видеохостинга пока не поддерживается!');
					return;
					break;
			}
			Video.add(video, function(res) {
				$scope.videos.push(res.data);
				$scope.layer.addVideo = null;
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.edit_video = function(opt) {
			Video.edit(opt, function(res) {
				$scope.videos = $scope.videos.map(function(el) {
					(el._id === $scope.layer.editedVideo._id) && (el._id = $scope.layer.editedVideo._id);
					return el;
				});
				$scope.layer.editedvideo = null;
				MSG.ok('Настройки фото успешно изменены!');
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.like = function(p, index) {
			var likeIndex = p.likes.indexOf($scope.options.user._id);
			if (likeIndex === -1) {
				Video.add_like(p, function(res) {
					$scope.videos[index].likes.push($scope.options.user._id);
				}, function(res) {
					console.error(res.data);
				});
			} else {
				Video.remove_like(p, function(res) {
					$scope.videos[index].likes.splice(likeIndex, 1);
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
				_id: $scope.videos[$scope.gallery.current]._id,
			};
			Video.add_comment(comment, function(res) {
				$scope.gallery.comment = '';
				$scope.videos[index].comments.push(comment);
				($routeParams.id !== $scope.options.user._id) && (comment.target = $routeParams.id, socket.emit('video:comment', comment));
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.remove_comment = function(index, comment) {
			Video.remove_comment({
				comment: comment,
				_id: $scope.videos[$scope.gallery.current]._id,
			}, function(res) {
				$scope.videos[index].comments = $scope.videos[index].comments.filter(function(el) {
					return !(el.userid === $scope.options.user._id && el.comment === comment);
				});
			}, function(res) {
				console.error(res.data);
			});
		};
	}
]);
