angular.module('MuscleMan').controller('ArticlesCtrl', ['$scope', 'Manager',
	function($scope,Manager) {
		$scope.articles = [];
		$scope.get_picture = function(id) {
			var imgsrc = $scope.articles[id].match(/src=\\"[\w+\:\\"\/+.+\d+-_]+\\"/);
			if (imgsrc.length) {
				imgsrc[0].replace('src=\\"','');
				imgsrc[0].length = imgsrc[0].length - 2;
				return imgsrc[0];
			}
			return null;
		};
		$scope.get_text = function(id) {
			var text = $scope.articles[id].match(/<p>[\w+ \d.]+<\/p>/);
			if(text.length) {
				text[0].replace('<p>','');
				text[0].replace('</p>','');
				return text[0];
			}
			return 0;
		};
		Manager.get_articles(Date.now(), function(res){
			$scope.articles = res.data;
		}, function(err){
			console.error(err);
		});
	}
]);
