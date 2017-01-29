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
    });