angular.module('MuscleMan').controller('SearchCtrl', ['$scope', 'User',
    function($scope, User) {
        $scope.search = {
            location_country: $scope.options.user.location_country
        };
        $scope.users = [];

        $scope.in_fav = function(id) {
            return ($scope.options.user.favs ? $scope.options.user.favs.indexOf(id) >= 0 : false);
        };

        $scope.fav = function(id) {
            if ($scope.in_fav(id)) {
                $scope.options.user.favs = $scope.options.user.favs.filter(function(el) {
                    return el !== id;
                });
            } else {
                $scope.options.user.favs.push(id);
            }
            $scope.$emit('user_save');
        };

        $scope.find_users = function() {
            if ($scope.search.fio) {
                $scope.search.name = $scope.search.fio.split(' ')[0];
                $scope.search.surname = $scope.search.fio.split(' ')[1];
            }
            User.search($scope.search, function(res) {
                $scope.users = res.data;
            }, function(res) {
                console.error(res.data);
            });
        };
    }
]);