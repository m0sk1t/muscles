angular.module('MuscleMan').controller('AlbumCtrl', ['$scope', '$routeParams', 'Photo', 'Album',
	function($scope, $routeParams, Photo, Album) {
		$scope.album = {};
		$scope.photos = [];
		Photo.get('all', function(res) {
			$scope.photos = res.data.filter(function(el) {
				return el.album === $routeParams.id;
			});
		}, function(res) {
			console.error(res.data);
		});
		Album.get($routeParams.id, function(res) {
			$scope.album = res.data;
		}, function(res) {
			console.error(res.data);
		});
	}
]);
