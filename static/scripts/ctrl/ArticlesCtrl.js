angular.module('MuscleMan').controller('ArticlesCtrl', ['$scope', 'Manager',
    function($scope, Manager) {
        $scope.articles = [];
        $scope.get_picture = function(id) {
            var imgsrc = $scope.articles[id].text.match(/src="[\w\:\\"\/\.\d-_]+"/);
            if (imgsrc && imgsrc.length) {
                imgsrc[0] = imgsrc[0].replace('src="', '');
                imgsrc[0] = imgsrc[0].replace('"', '');
                return imgsrc[0];
            }
        };
        Manager.get_themes(function(res) {
            $scope.themes = res.data;
        }, function(res) {
            console.error(res.data);
        });
        Manager.get_sports(function(res) {
            $scope.sports = res.data;
        }, function(res) {
            console.error(res.data);
        });
        $scope.format_date = function(date) {
            return moment(date).format('DD.MM.YYYY');
        };
        Manager.get_articles(Date.now(), function(res) {
            $scope.articles = res.data;
        }, function(err) {
            console.error(err);
        });
    }
]);