angular.module('MuscleMan').controller('ContestCtrl', ['$scope', '$routeParams', 'User',
    function($scope, $routeParams, User) {
        var id = $routeParams.id;
        $scope.contest = {};
        User.view_contest(id, function(res) {}, function(err) { console.error(err) });
        User.get_contest(id, function(res) {
            $scope.contest = res.data;
            $scope.estimate_days = String(moment($scope.contest.dateParticipate).diff(Date.now(), 'days')).match(/\d/g);
        }, function(res) {
            console.error(res.data);
        });
        $scope.expired = function() {
            return moment($scope.contest.dateParticipate).diff(Date.now(), 'days');
        };
        $scope.count_free_likes = function() {
            var count = 0;
            $scope.contest.participants && $scope.contest.participants.map(function(el) {
                count += el.likes.free.length;
            });
            return count;
        };
        $scope.count_paid_likes = function() {
            var count = 0;
            $scope.contest.participants && $scope.contest.participants.map(function(el) {
                count += el.likes.paid.length;
            });
            return count;
        };
        $scope.count_new_participants = function() {
            var now = moment.now();
            if ($scope.contest.participants) {
                return $scope.contest.participants.filter(function(el) {
                    return moment(el.pDate).diff(now, 'days') === 1;
                }).length;
            }
        };
        $scope.add_paid_like = function(pid) {
            User.add_paid_like(id, pid, function(res) {
                $scope.contest = res.data;
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.add_free_like = function(pid) {
            User.add_free_like(id, pid, function(res) {
                $scope.contest = res.data;
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.participate = function() {
            var index = $scope.contest.participants.indexOf($scope.options.user._id);
            if (index === -1) {
                User.add_contest_participant(id, function(res) {
                    $scope.contest = res.data;
                }, function(res) {
                    console.error(res.data);
                });
            } else {
                User.rm_contest_participant(id, function(res) {
                    $scope.contest.participants.splice(index, 1);
                    //$scope.contest = res.data;
                }, function(res) {
                    console.error(res.data);
                });
            }
        };
    }
]);