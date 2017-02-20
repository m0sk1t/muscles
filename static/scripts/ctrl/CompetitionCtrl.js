angular.module('MuscleMan').controller('CompetitionCtrl', ['$scope', '$routeParams', 'User',
    function($scope, $routeParams, User) {
        $scope.location = location.href;
        $scope.competition = {};
        $scope.add_comment = function() {
            if (!$scope.comment) return;
            User.competition_add_comment($routeParams.id, { comment: $scope.comment }, function(res) {
                $scope.competition.comments.push({
                    date: new Date(),
                    comment: $scope.comment,
                    name: $scope.options.user.name,
                    avatar: $scope.options.user.avatar,
                    surname: $scope.options.user.surname,
                });
                $scope.comment = '';
            }, function(err) {
                console.error(err);
            });
        };
        $scope.format_date = function(date) {
            return moment(date).format('DD.MM.YYYY');
        };
        User.get_competition($routeParams.id, function(res) {
            $scope.competition = res.data;
        }, function(res) {
            console.error(res.data);
        });
    }
]);