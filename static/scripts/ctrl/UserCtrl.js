angular.module('MuscleMan').controller('UserCtrl', ['$scope',
	function($scope) {
		$scope.getAge = function(birthDate) {
			var now = moment(),
				birthDate = moment(birthDate);
			return now.diff(birthDate, 'years');
		};
		$scope.user_save = function() {
			$scope.$emit('user_save');
		}
	}
]);
