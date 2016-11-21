angular.module('MuscleMan').controller('ContestsCtrl', ['$scope', 'User',
	function($scope, User) {
		$scope.contests = [];
		User.get_contest('all', function(res) {
			$scope.contests = res.data;
		}, function(res) {
			console.error(res.data);
		});
	}
]);
