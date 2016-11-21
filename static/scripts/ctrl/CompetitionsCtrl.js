angular.module('MuscleMan').controller('CompetitionsCtrl', ['$scope', 'User',
	function($scope, User) {
		$scope.competitions = [];
		User.get_competition('all', function(res) {
			$scope.competitions = res.data;
		}, function(res) {
			console.error(res.data);
		});
	}
]);
