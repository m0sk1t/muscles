angular.module('MuscleMan').controller('UserCtrl', ['$scope', '$location', '$routeParams', 'socket', '$VK', '$facebook', 'User', 'MSG', 'Topic', 'Photo', 'Video', 'Dialog', 'Upload',
	function($scope, $location, $routeParams, socket, $VK, $facebook, User, MSG, Topic, Photo, Video, Dialog, Upload) {
		$scope.user = {};
		$scope.photos = [];
		$scope.topics = [];
		$scope.gallery = {
			current: null,
			add_image: null,
		};

		$scope.last_seen = function() {
			return moment($scope.user.lastOnline).fromNow();
		};

		$scope.my_vk_friends = function() {
			VK.api('friends.get', function(res) {
				$scope.options.user.social ? ($scope.options.user.social.vk_subscribers = res.data.count) : $scope.options.user.social = { vk_subscribers: res.data.count };
				$scope.user_save();
			});
		};

		$scope.my_facebook_friends = function() {
			$facebook.login('public_profile,email,user_friends,user_photos,user_videos').then(function(res) {
				$facebook.api('/me').then(function(res) {
					console.log(res);
					$facebook.api('/' + res.id + '/friends').then(function(res) {
						$scope.options.user.social ? ($scope.options.user.social.fb_subscribers = res.summary.total_count) : $scope.options.user.social = { fb_subscribers: res.summary.total_count };
						$scope.user_save();
						console.log(res);
					}, function(err) {
						console.error(err);
					});
				}, function(err) {
					console.error(err);
				});
			}, function(err) {
				console.error(err);
			});
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
			return moment(birthDate).format("DD.MM.YYYY");
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

		Topic.get($routeParams.id, function(res) {
			$scope.topics = res.data;
		}, function(res) {
			console.error(res.data);
		});

		$scope.user_save = function() {
			$scope.$emit('user_save');
		};

		$scope.send_message = function(data) {
			$scope.$emit('new_message', data);
		};

		$scope.add_image_to_topic = function(img) {
			var i = $scope.topic.images.indexOf(img);
			if (i === -1) {
				$scope.topic.images.push(img);
			} else {
				$scope.topic.images.splice(i, 1);
			}
		};

		$scope.add_video_to_topic = function(v) {
			var i = -1;
			$scope.topic.videos.map(function(el, index) {
				el._id === v._id && (i = index);
			});
			if (i === -1) {
				$scope.topic.videos.push(v);
			} else {
				$scope.topic.videos.splice(i, 1);
			}
		};

		$scope.add_topic = function() {
			$scope.topic = {
				text: '',
				images: [],
				videos: [],
				comment: '',
			};
		};

		$scope.load_countries = function() {
			$VK.get_countries(function(res) {
				$scope.countries = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.load_cities = function() {
			$VK.get_cities({
				country_id: ($scope.university ? $scope.university.country_id : ($scope.workplace ? $scope.workplace.country_id : $scope.achievement.country_id))
			}, function(res) {
				$scope.cities = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.load_universities = function() {
			$VK.get_universities({
				city_id: $scope.university.city_id,
				country_id: $scope.university.country_id,
			}, function(res) {
				$scope.universities = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.load_faculties = function() {
			$VK.get_faculties({
				university_id: $scope.university.university_id
			}, function(res) {
				$scope.faculties = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.load_chairs = function() {
			$VK.get_chairs({
				faculty_id: $scope.university.faculty_id
			}, function(res) {
				$scope.chairs = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.add_university = function() {
			$scope.load_countries();
			$scope.university = {
				city_id: '',
				country_id: '',
				university_id: '',
				faculty_id: '',
				chair_id: '',
				city: '',
				country: '',
				university: '',
				faculty: '',
				chair: '',
				speciality: '',
				year_end: +(new Date()).getFullYear(),
				year_start: +(new Date()).getFullYear(),
			};
		};

		$scope.save_university = function() {
			User.add_university($scope.university, function(res) {
				$scope.options.user._id === $scope.user._id && $scope.user.universities.push($scope.university);
				$scope.options.user.universities.push($scope.university);
				$scope.university = null;
			}, function(res) {
				console.error(res.data)
			});
		};

		$scope.rm_university = function(u, i) {
			User.rm_university(u, function(res) {
				$scope.options.user.universities.splice(i, 1);
				$scope.user.universities.splice(i, 1);
			}, function(res) {
				console.error(res.data)
			});
		};

		$scope.add_workplace = function() {
			$scope.load_countries();
			$scope.workplace = {
				city: '',
				country: '',
				city_id: '',
				country_id: '',
				company: '',
				speciality: '',
				year_end: +(new Date()).getFullYear(),
				year_start: +(new Date()).getFullYear(),
			};
		};

		$scope.save_workplace = function() {
			User.add_workplace($scope.workplace, function(res) {
				$scope.options.user._id === $scope.user._id && $scope.user.workplaces.push($scope.workplace);
				$scope.options.user.workplaces.push($scope.workplace);
				$scope.workplace = null;
			}, function(res) {
				console.error(res.data)
			});
		};

		$scope.rm_workplace = function(w, i) {
			User.rm_workplace(w, function(res) {
				$scope.options.user.workplaces.splice(i, 1);
				$scope.user.workplaces.splice(i, 1);
			}, function(res) {
				console.error(res.data)
			});
		};

		$scope.add_achievement = function() {
			$scope.load_countries();
			$scope.achievement = {
				city: '',
				country: '',
				city_id: '',
				country_id: '',
				title: '',
				place: '',
				comment: '',
				year: +(new Date()).getFullYear(),
			};
		};

		$scope.save_achievement = function() {
			User.add_achievement($scope.achievement, function(res) {
				$scope.options.user._id === $scope.user._id && $scope.user.achievements.push($scope.achievement);
				$scope.options.user.achievements.push($scope.achievement);
				$scope.achievement = null;
			}, function(res) {
				console.error(res.data)
			});
		};

		$scope.rm_achievement = function(w, i) {
			User.rm_achievement(w, function(res) {
				$scope.options.user.achievements.splice(i, 1);
				$scope.user.achievements.splice(i, 1);
			}, function(res) {
				console.error(res.data)
			});
		};

		$scope.new_topic = function() {
			Topic.new($scope.topic, function(res) {
				$scope.topics.push(res.data);
				$scope.topic = {
					text: '',
					images: [],
					comment: '',
				};
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.del_topic = function(index) {
			Topic.del($scope.topics[index]._id, function(res) {
				$scope.topics.splice(index, 1);
			}, function(res) {
				console.error(res.data);
			});
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
				_id: $scope.photos[index]._id,
				name: $scope.options.user.name,
				userid: $scope.options.user._id,
				comment: $scope.gallery.comment,
				avatar: $scope.options.user.avatar,
				surname: $scope.options.user.surname,
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

		$scope.add_topic_comment = function(index) {
			var comment = {
				date: Date.now(),
				comment: $scope.topic.comment,
				_id: $scope.topics[index]._id,
				name: $scope.options.user.name,
				userid: $scope.options.user._id,
				avatar: $scope.options.user.avatar,
				surname: $scope.options.user.surname,
			};
			Topic.add_comment(comment, function(res) {
				$scope.topic.comment = '';
				$scope.topics[index].comments.push(comment);
				($routeParams.id !== $scope.options.user._id) && (comment.target = $routeParams.id, socket.emit('topic:comment', comment));
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.remove_topic_comment = function(index, comment) {
			Topic.remove_comment({
				comment: comment,
				_id: $scope.topics[index]._id,
			}, function(res) {
				$scope.topics[index].comments = $scope.topics[index].comments.filter(function(el) {
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
			});
		}
		$scope.user_save = function() {
			$scope.$emit('user_save');
		};
	}
]);
