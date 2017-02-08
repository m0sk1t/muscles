angular.module('MuscleMan')
    .filter('search_filter', function() {
        return function(els, order, sport) {
            var tmp = els.sort(function(a, b) {
                if (order === 'rating') {
                    switch (true) {
                        case a.rating > b.rating:
                            return 1;
                        case a.rating < b.rating:
                            return -1;
                        default:
                            return 0;
                    }
                }
                if (order === 'age') {
                    var aDate = (new Date(a.birthDate)).valueOf(),
                        bDate = (new Date(b.birthDate)).valueOf();
                    switch (true) {
                        case aDate < bDate:
                            return 1;
                        case aDate > bDate:
                            return -1;
                        default:
                            return 0;
                    }
                }
            });
            if (sport) {
                tmp = tmp.filter(function(el) {
                    return el.sports.indexOf(sport) !== -1;
                });
            }
            return tmp;
        };
    });