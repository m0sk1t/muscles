angular.module('MuscleMan').controller('ManageArticleCtrl', ['$scope', '$location', 'Manager', '$routeParams',
	function($scope, $location, Manager, $routeParams) {
		$scope.froalaOptions = {
			language: 'ru',
			imageInsertButtons: 'imageByURL',
			placeholderText: 'Введите текст новости',
			imageAllowedTypes: ['jpeg', 'jpg', 'png'],
			toolbarButtons: ['bold', 'italic', 'underline', 'strikeThrough', 'fontSize', '|', 'emoticons', 'color', 'inlineStyle', 'paragraphStyle', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', 'quote', 'insertHR', '-', 'insertLink', 'insertImage']
		};
		Manager.get_article($routeParams.id, function(res) {
			$scope.article = res.data;
		}, function(res) {
			console.error(res.data);
		});
		$scope.update_article = function() {
			Manager.update_article($routeParams.id, $scope.article, function(res) {
				window.history.back();
			}, function(res) {
				console.error(res.data);
			});
		};
	}
]);
