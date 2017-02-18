angular.module('MuscleMan').controller('ManageCompetitionCtrl', ['$scope', '$location', 'Manager', '$routeParams',
    function($scope, $location, Manager, $routeParams) {
        Manager.get_competition($routeParams.id, function(res) {
            $scope.competition = res.data;
            $scope.competition.start = new Date($scope.competition.start);
            $scope.competition.end = new Date($scope.competition.end);
        }, function(res) {
            console.error(res.data);
        });
        Manager.get_sports(function(res) {
            $scope.sports = res.data;
        }, function(err) {
            console.error(err);
        });
        $scope.update_competition = function() {
            Manager.update_competition($routeParams.id, $scope.competition, function(res) {
                window.history.back();
            }, function(res) {
                console.error(res.data);
            });
        };
    }
]);