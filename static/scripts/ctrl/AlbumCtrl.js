angular.module('MuscleMan').controller('AlbumCtrl', ['$scope', '$routeParams', 'Photo', 'Album',
	function($scope, $routeParams, Photo, Album) {
		$scope.album = {};
		$scope.photos = [];

		$scope.gallery = {
			current: null
		};

		$scope.turnLeft = function() {
			$scope.gallery.current == 0 ? $scope.gallery.current = $scope.photos.length : $scope.gallery.current--;
		};
		$scope.turnRight = function() {
			$scope.gallery.current == $scope.photos.length - 1 ? $scope.gallery.current = 0 : $scope.gallery.current++;
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
