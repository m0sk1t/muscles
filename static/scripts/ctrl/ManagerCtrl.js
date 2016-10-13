angular.module('MuscleMan').controller('ManagerCtrl', ['$scope', '$location', 'Manager', '$routeParams',
	function($scope, $location, Manager, $routeParams) {
		$scope.add_manager = function() {
			$scope.cred = {
				login: '',
				password: '',
			};
		};
		Manager.get($routeParams.id, function(res) {
			$scope.manager = res.data;
			switch (true) {
				case $scope.manager.permission.users:
					$scope.page = 'users';
					$scope.get_users();
					break;
				case $scope.manager.permission.photos:
					$scope.page = 'photos';
					$scope.get_photos();
					break;
				case $scope.manager.permission.videos:
					$scope.page = 'videos';
					$scope.get_videos();
					break;
				case $scope.manager.permission.topics:
					$scope.page = 'topics';
					$scope.get_topics();
					break;
				case $scope.manager.permission.articles:
					$scope.page = 'article';
					$scope.get_articles();
					break;
				case $scope.manager.permission.contests:
					$scope.page = 'contests';
					$scope.get_contests();
					break;
				case $scope.manager.permission.hobbies:
					$scope.page = 'hobbies';
					$scope.get_hobbies();
					break;
				case $scope.manager.permission.managers:
					$scope.page = 'managers';
					$scope.get_managers();
					break;
				case $scope.manager.permission.competitions:
					$scope.page = 'competitions';
					$scope.get_competitions();
					break;
				default:
					$location.path('/manager/signin');
					break;
			}
		}, function(res) {
			console.error(res.data);
		});
		$scope.create_manager = function() {
			Manager.create($scope.cred, function(res) {
				$scope.cred = null;
				$scope.managers.push(res.data);
			}, function(res) {
				console.error(res.data);
			});
		};
		$scope.delete_manager = function(id, i) {
			Manager.delete(id, function(res) {
				$scope.managers.splice(i, 1);
			}, function(res) {
				console.error(res.data);
			});
		};
		$scope.get_managers = function() {
			Manager.all(function(res) {
				$scope.managers = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};
		$scope.set_permission = function(id, i) {
			Manager.set_permission(id, $scope.managers[i].permission, function(res) {
				console.log('permission saved');
			}, function(res) {
				console.error(res.data);
			});
		};
		$scope.get_photos = function() {
			Manager.get_photos(function(res) {
				$scope.photos = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};
		$scope.delete_photo = function(id, i) {
			Manager.delete_photo(id, function(res) {
				$scope.photos.splice(i, 1);
			}, function(res) {
				console.error(res.data);
			})
		};
		$scope.get_videos = function() {
			Manager.get_videos(function(res) {
				$scope.videos = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};
		$scope.delete_video = function(id, i) {
			Manager.delete_video(id, function(res) {
				$scope.videos.splice(i, 1);
			}, function(res) {
				console.error(res.data);
			})
		};
		$scope.get_topics = function() {
			Manager.get_topics(function(res) {
				$scope.topics = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};
		$scope.delete_topic = function(id, i) {
			Manager.delete_topic(id, function(res) {
				$scope.topics.splice(i, 1);
			}, function(res) {
				console.error(res.data);
			})
		};
		$scope.get_users = function() {
			Manager.get_users(function(res) {
				$scope.users = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};
		$scope.delete_user = function(id, i) {
			Manager.delete_user(id, function(res) {
				$scope.users.splice(i, 1);
			}, function(res) {
				console.error(res.data);
			})
		};
		$scope.get_hobbies = function() {
			Manager.get_hobbies(function(res) {
				$scope.hobbies = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};
		$scope.delete_hobbie = function(id, i) {
			Manager.delete_hobbie(id, function(res) {
				$scope.hobbies.splice(i, 1);
			}, function(res) {
				console.error(res.data);
			})
		};
		$scope.get_articles = function() {
			Manager.get_articles(function(res) {
				$scope.articles = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};
		$scope.delete_article = function(id, i) {
			Manager.delete_article(id, function(res) {
				$scope.articles.splice(i, 1);
			}, function(res) {
				console.error(res.data);
			})
		};
		$scope.get_contests = function() {
			Manager.get_contests(function(res) {
				$scope.contests = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};
		$scope.delete_contest = function(id, i) {
			Manager.delete_contest(id, function(res) {
				$scope.contests.splice(i, 1);
			}, function(res) {
				console.error(res.data);
			})
		};
		$scope.get_competitions = function() {
			Manager.get_competitions(function(res) {
				$scope.competitions = res.data;
			}, function(res) {
				console.error(res.data);
			});
		};
		$scope.delete_competition = function(id, i) {
			Manager.delete_competition(id, f $scope.competitions.splice(i, 1); unction(res) {}, function(res) {
				console.error(res.data);
			})
		};
	}
]);
