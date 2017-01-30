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