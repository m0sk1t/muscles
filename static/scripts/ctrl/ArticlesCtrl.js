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
        $scope.format_date = function(date) {
            return moment(date).format('DD.MM.YYYY');
        };
        $scope.get_text = function(id) {
            var text = $scope.articles[id].text.match(/<p>[\w+ \d.]+<\/p>/);
            if (text.length) {
                text[0] = text[0].replace('<p>', '');
                text[0] = text[0].replace('</p>', '');
                return text[0];
            }
            return 0;
        };
        Manager.get_articles(Date.now(), function(res) {
            $scope.articles = res.data;
        }, function(err) {
            console.error(err);
        });
    }
]);