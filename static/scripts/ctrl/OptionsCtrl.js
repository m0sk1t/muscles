angular.module('MuscleMan').controller('OptionsCtrl', ['$scope', 'MSG', 'Upload', 'User', 'LS', '$vk',
	function($scope, MSG, Upload, User, LS, $vk) {
		$scope.cred = {
			old_password: '',
			new_password: ''
		};

		User.get(function(res) {
			$scope.options.user = res.data;
			LS.set('user', res.data);
		}, function(res) {
			console.error(res.data);
		});

		$scope.active_page = 'profile';

		$scope.unlink = function(provider) {
			User.unlink(provider, function(res) {
				$scope.options.user.social[provider] = undefined;
				$scope.options.user.tokens[provider] = undefined;
			}, function(res) {
				console.error(res.data);
			});
		}

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

		$scope.load_countries = function() {
			$vk.get_countries(function(res) {
				$scope.countries = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.load_cities = function() {
			$vk.get_cities({
				country_id: ($scope.university ? $scope.university.country_id : ($scope.workplace ? $scope.workplace.country_id : $scope.achievement.country_id))
			}, function(res) {
				$scope.cities = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.load_universities = function() {
			$vk.get_universities({
				city_id: $scope.university.city_id,
				country_id: $scope.university.country_id,
			}, function(res) {
				$scope.universities = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.load_faculties = function() {
			$vk.get_faculties({
				university_id: $scope.university.university_id
			}, function(res) {
				$scope.faculties = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.load_chairs = function() {
			$vk.get_chairs({
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
			if ($scope.university.year_end && $scope.university.year_start > $scope.university.year_end) {
				MSG.err('Год начала не может быть больше года окончания');
				return;
			}
			User.add_university($scope.university, function(res) {
				$scope.options.user.universities.push($scope.university);
				$scope.university = null;
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.rm_university = function(u, i) {
			User.rm_university(u, function(res) {
				$scope.options.user.universities.splice(i, 1);
			}, function(res) {
				console.error(res.data);
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
			if ($scope.workplace.year_end && $scope.workplace.year_start > $scope.workplace.year_end) {
				MSG.err('Год начала не может быть больше года окончания');
				return;
			}
			User.add_workplace($scope.workplace, function(res) {
				$scope.options.user.workplaces.push($scope.workplace);
				$scope.workplace = null;
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.rm_workplace = function(w, i) {
			User.rm_workplace(w, function(res) {
				$scope.options.user.workplaces.splice(i, 1);
			}, function(res) {
				console.error(res.data);
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
				$scope.options.user.achievements.push($scope.achievement);
				$scope.achievement = null;
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.rm_achievement = function(w, i) {
			User.rm_achievement(w, function(res) {
				$scope.options.user.achievements.splice(i, 1);
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.user_save = function() {
			$scope.$emit('user_save');
			MSG.ok('Сохранено успешно!');
		};
	}
]);
