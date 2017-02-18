angular.module('MuscleMan').controller('CompetitionsCtrl', ['$scope', 'User', 'uiCalendarConfig', 'Manager',
    function($scope, User, uiCalendarConfig, Manager) {
        $scope.calendarOptions = {
            eventClick: function(calEvent, jsEvent, view) {
                location.hash = '#/competition/' + calEvent._id;
            }
        };
        Manager.get_sports(function(res) {
            $scope.sports = res.data;
        }, function(err) {
            console.error(err);
        });
        $scope.change_view = function(view, calendar) {
            uiCalendarConfig.calendars[calendar].fullCalendar('changeView', view);
        };
        $scope.eventSources = {
            url: '/competition/all',
        };
    }
]);