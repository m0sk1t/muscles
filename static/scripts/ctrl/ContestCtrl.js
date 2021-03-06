angular.module('MuscleMan').controller('ContestCtrl', ['$scope', '$routeParams', 'User', 'MSG',
    function($scope, $routeParams, User, MSG) {
        var id = $routeParams.id;
        $scope.type = '';
        $scope.contest = {};
        User.view_contest(id, function(res) {}, function(err) { console.error(err) });
        User.get_contest(id, function(res) {
            $scope.contest = res.data;
            var estimate = moment.utc(moment($scope.contest.dateEnd).diff(moment(Date.now()))).format("DD:HH:mm").split(':');
            $scope.estimate_days = estimate[0].match(/\d/g);
            $scope.estimate_hours = estimate[1].match(/\d/g);
            $scope.estimate_minutes = estimate[2].match(/\d/g);
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
                MSG.err(res.data);
                console.error(res.data);
            });
        };
        $scope.add_free_like = function(pid) {
            User.add_free_like(id, pid, function(res) {
                $scope.contest = res.data;
            }, function(res) {
                MSG.err(res.data);
                console.error(res.data);
            });
        };
        $scope.may_participate = function() {
            if ($scope.contest.participants) {
                return !$scope.contest.participants.filter(function(p) { return p.id === $scope.options.user._id }).length;
            }
        };
        $scope.participate = function() {
            if ($scope.contest.participants) {
                if ($scope.contest.participants.filter(function(p) { return p.id === $scope.options.user._id }).length) {
                    User.rm_contest_participant(id, function(res) {
                        $scope.contest.participants = $scope.contest.participants.filter(function(p) {
                            return p.id !== $scope.options.user._id;
                        });
                    }, function(res) {
                        console.error(res.data);
                    });
                } else {
                    User.add_contest_participant(id, function(res) {
                        $scope.contest.participants.push({
                            id: $scope.options.user._id,
                            pDate: Date.now(),
                            name: $scope.options.user.name,
                            avatar: $scope.options.user.avatar,
                            likes: {
                                paid: [],
                                free: [],
                            }
                        });
                    }, function(res) {
                        console.error(res.data);
                    });
                }
            }
        };
    }
]);