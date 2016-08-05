angular.module('MuscleMan').controller('OptionsCtrl', ['$scope',
	function($scope) {
		$scope.cred = {
			old_password: '',
			new_password: ''
		};
		$scope.active_page = 'profile';
	}
]);
