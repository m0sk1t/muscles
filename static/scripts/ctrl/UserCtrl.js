angular.module('MuscleMan').controller('UserCtrl', ['$scope', '$routeParams', 'Photo',
	function($scope, $routeParams, Photo) {
		$scope.photos = [];

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
	}
]);
