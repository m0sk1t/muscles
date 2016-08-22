angular.module('MuscleMan').controller('DialogsCtrl', ['$scope', 'Dialog',
	function($scope, Dialog) {
		Dialog.get(function(res) {}, function(res) {});
	}
]);
