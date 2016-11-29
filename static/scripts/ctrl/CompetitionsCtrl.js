angular.module('MuscleMan').controller('CompetitionsCtrl', ['$scope', 'User', 'uiCalendarConfig',
	function($scope, User, uiCalendarConfig) {
		$scope.calendarOptions = {
			eventClick: function(calEvent, jsEvent, view) {
				location.hash = '#/competition/' + calEvent._id;
			}
		};
		$scope.change_view = function(view, calendar) {
			uiCalendarConfig.calendars[calendar].fullCalendar('changeView', view);
		};
		$scope.eventSources = {
			url: '/competition/all',
		};
	}
]);
