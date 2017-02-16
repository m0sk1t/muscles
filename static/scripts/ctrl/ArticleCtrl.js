angular.module('MuscleMan').controller('ArticleCtrl', ['$sce', '$scope', '$routeParams', 'Manager',
    function($sce, $scope, $routeParams, Manager) {
        $scope.article = {};
        $scope.format_date = function(date) {
            return moment(date).format('DD.MM.YYYY');
        };
        Manager.get_article($routeParams.id, function(res) {
            $scope.article = res.data;
        }, function(res) {
            console.error(res.data);
        });
        $scope.article_html = function() {
            return $sce.trustAsHtml($scope.article.text);
        };
        $scope.add_comment = function() {
            Manager.comment_article($routeParams.id, { comment: $scope.comment }, function(res) {
                $scope.article.comments.push({
                    date: new Date(),
                    comment: $scope.comment,
                    name: $scope.options.user.name,
                    userid: $scope.options.user._id,
                    avatar: $scope.options.user.avatar,
                    surname: $scope.options.user.surname,
                });
                $scope.comment = '';
            }, function(err) {
                console.error(err);
            })
        };
    }
]);