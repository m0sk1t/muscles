angular.module('MuscleMan')
    .directive('userLinksBlock', function() {
        return {
            restrict: 'E',
            templateUrl: 'tpl/directives/user-links-block.tpl'
        }
    })
    .directive('adsBlock', function() {
        return {
            restrict: 'E',
            templateUrl: 'tpl/directives/ads-block.tpl'
        }
    })
    .directive('photoSliderBlock', function() {
        return {
            restrict: 'E',
            templateUrl: 'tpl/directives/photo-slider-block.tpl'
        }
    })
    .directive('videoSliderBlock', function() {
        return {
            restrict: 'E',
            templateUrl: 'tpl/directives/video-slider-block.tpl'
        }
    })
    .directive('autocompleteBlock', ['$vk', function($vk) {
        return {
            restrict: 'E',
            scope: {
                area: '@',
                city: '=',
                onSet: '&',
                chair: '=',
                substr: '=',
                country: '=',
                faculty: '=',
                university: '=',
            },
            templateUrl: 'tpl/directives/autocomplete-block.tpl',
            link: function($scope, el, attrs) {
                $scope.load = function() {
                    switch ($scope.area) {
                        case 'country':
                            $vk.get_countries(function(res) {
                                $scope.items = res.data;
                            }, function(err) {
                                console.error(err);
                            });
                            break;
                        case 'city':
                            $vk.get_cities({
                                q: $scope.substr,
                                country_id: $scope.country,
                            }, function(res) {
                                $scope.items = res.data;
                            }, function(err) {
                                console.error(err);
                            });
                            break;
                        case 'university':
                            $vk.get_universities({
                                q: $scope.substr,
                                city_id: $scope.city,
                                country_id: $scope.country,
                            }, function(res) {
                                $scope.items = res.data;
                            }, function(err) {
                                console.error(err);
                            });
                            break;
                        case 'faculty':
                            $vk.get_faculties({
                                q: $scope.substr,
                                city_id: $scope.city,
                                country_id: $scope.country,
                                university_id: $scope.university,
                            }, function(res) {
                                $scope.items = res.data;
                            }, function(err) {
                                console.error(err);
                            });
                            break;
                        case 'chair':
                            $vk.get_faculties({
                                q: $scope.substr,
                                city_id: $scope.city,
                                faculty_id: $scope.faculty,
                                country_id: $scope.country,
                                university_id: $scope.university,
                            }, function(res) {
                                $scope.items = res.data;
                            }, function(err) {
                                console.error(err);
                            });
                            break;
                    }
                };
                $scope.set = function(item) {
                    $scope.items = [];
                    $scope.substr = item.title;
                    $scope.onSet({ item: item });
                };
            }
        }
    }])