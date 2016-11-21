angular.module('MuscleMan').controller('FavsCtrl', ['$scope', 'User',
	function($scope, User) {
		$scope.favs = [];
		User.get_favs(function(res) {
			$scope.favs = res.data;
		}, function(res) {
			console.error(res.data);
		});
	}
]);
