angular.module('MuscleMan').controller('ContestsCtrl', ['$scope', 'User',
    function($scope, User) {
        $scope.contests = [];
        $scope.format_date = function(date) {
            return moment(date).format('DD.MM.YYYY');
        };
        User.get_contest('all', function(res) {
            $scope.contests = res.data;
        }, function(res) {
            console.error(res.data);
        });
    }
]);