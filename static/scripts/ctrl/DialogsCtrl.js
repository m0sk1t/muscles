angular.module('MuscleMan').controller('DialogsCtrl', ['$scope', 'Dialog',
	function($scope, Dialog) {
		$scope.dialogs = [];
		$scope.messages = [];
		Dialog.get(function(res) {
			$scope.dialogs = res.data;
		}, function(res) {
			console.error(res.data);
		});
	}
]);
