angular.module('MuscleMan').controller('DialogsCtrl', ['$scope', 'Dialog',
	function($scope, Dialog) {
		$scope.dialogs = [];
		$scope.messages = [];
		Dialog.get(function(res) {
			$scope.dialogs = res.data;
		}, function(res) {
			console.error(res.data);
		});
		$scope.set_messages = function(d) {
			$scope.messages = d.messages;
		};
		$scope.delete_dialog = function(d, i) {
			Dialog.delete(d._id, function(res) {
				$scope.messages = [];
				$scope.dialogs.splice(i, 1);
			}, function(res) {
				console.error(res.data);
			});
		};
		$scope.with_user = function(d) {
			var user = d.users.filter(function(el) {
				return el.id !== $scope.options.user._id;
			})[0];
			return (user ? user.fio : 'пользователь покинул беседу...');
		};
	}
]);
