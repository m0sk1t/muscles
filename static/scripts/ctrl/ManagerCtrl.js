angular.module('MuscleMan').controller('ManagerCtrl', ['$sce', '$scope', '$location', 'Manager', '$routeParams',
    function($sce, $scope, $location, Manager, $routeParams) {
        $scope.items = {
            cred: null,
            sport: null,
            hobbie: null,
            theme: null,
        };
        $scope.creDate = {
            users: new Date(),
            photos: new Date(),
            videos: new Date(),
            topics: new Date(),
            articles: new Date(),
            contests: new Date(),
            competitions: new Date(),
        };
        $scope.article_html = function(html) {
            return $sce.trustAsHtml(html);
        };
        $scope.add_manager = function() {
            $scope.items.cred = {
                login: '',
                password: '',
            };
        };
        $scope.create_manager = function() {
            Manager.create($scope.items.cred, function(res) {
                $scope.items.cred = null;
                $scope.managers.push(res.data);
            }, function(res) {
                $scope.items.cred = null;
                console.error(res.data);
            });
        };
        $scope.delete_manager = function(id, i) {
            Manager.delete(id, function(res) {
                $scope.managers.splice(i, 1);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.get_themes = function() {
            Manager.get_themes(function(res) {
                $scope.themes = res.data;
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.add_theme = function() {
            $scope.items.theme = {
                title: '',
            };
        };
        $scope.create_theme = function() {
            Manager.create_theme($scope.items.theme, function(res) {
                $scope.items.theme = null;
                $scope.themes.push(res.data);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.delete_theme = function(id, i) {
            Manager.delete_theme(id, function(res) {
                $scope.themes.splice(i, 1);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.get_hobbies = function() {
            Manager.get_hobbies(function(res) {
                $scope.hobbies = res.data;
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.add_hobbie = function() {
            $scope.items.hobbie = {
                type: 0,
                item: '',
            };
        };
        $scope.create_hobbie = function() {
            Manager.create_hobbie($scope.items.hobbie, function(res) {
                $scope.items.hobbie = null;
                $scope.hobbies.push(res.data);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.delete_hobbie = function(id, i) {
            Manager.delete_hobbie(id, function(res) {
                $scope.hobbies.splice(i, 1);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.get_sports = function() {
            Manager.get_sports(function(res) {
                $scope.sports = res.data;
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.add_sport = function() {
            $scope.items.sport = {
                sex: 1,
                sport: '',
            };
        };
        $scope.create_sport = function() {
            Manager.create_sport($scope.items.sport, function(res) {
                $scope.items.sport = null;
                $scope.sports.push(res.data);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.delete_sport = function(id, i) {
            Manager.delete_sport(id, function(res) {
                $scope.sports.splice(i, 1);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.get_managers = function() {
            Manager.all(function(res) {
                $scope.managers = res.data;
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.set_permission = function(id, i) {
            Manager.set_permission(id, $scope.managers[i].permission, function(res) {
                console.log('permission saved');
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.get_photos = function() {
            Manager.get_photos($scope.creDate.photos, function(res) {
                $scope.photos = res.data;
                //$scope.creDate.photos = $scope.photos[0].creDate;
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.delete_photo = function(id, i) {
            Manager.delete_photo(id, function(res) {
                $scope.photos.splice(i, 1);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.get_videos = function() {
            Manager.get_videos($scope.creDate.videos, function(res) {
                $scope.videos = res.data;
                //$scope.creDate.videos = $scope.videos[0].creDate;
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.delete_video = function(id, i) {
            Manager.delete_video(id, function(res) {
                $scope.videos.splice(i, 1);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.get_topics = function() {
            Manager.get_topics($scope.creDate.topics, function(res) {
                $scope.topics = res.data;
                //$scope.creDate.topics = $scope.topics[0].creDate;
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.delete_topic = function(id, i) {
            Manager.delete_topic(id, function(res) {
                $scope.topics.splice(i, 1);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.get_users = function() {
            Manager.get_users($scope.creDate.users, function(res) {
                $scope.users = res.data;
                //$scope.creDate.users = $scope.users[0].creDate;
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.delete_user = function(id, i) {
            Manager.delete_user(id, function(res) {
                $scope.users.splice(i, 1);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.get_articles = function() {
            Manager.get_articles($scope.creDate.articles, function(res) {
                $scope.articles = res.data;
                //$scope.creDate.articles = $scope.users[0].creDate;
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.create_article = function() {
            Manager.create_article(function(res) {
                $location.path('/manage/article/' + res.data._id);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.delete_article = function(id, i) {
            Manager.delete_article(id, function(res) {
                $scope.articles.splice(i, 1);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.create_contest = function() {
            Manager.create_contest(function(res) {
                $location.path('/manage/contest/' + res.data._id);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.get_contests = function() {
            Manager.get_contests($scope.creDate.contests, function(res) {
                $scope.contests = res.data;
                //$scope.creDate.contests = $scope.users[0].creDate;
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.delete_contest = function(id, i) {
            Manager.delete_contest(id, function(res) {
                $scope.contests.splice(i, 1);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.create_competition = function() {
            Manager.create_competition(function(res) {
                $location.path('/manage/competition/' + res.data._id);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.get_competitions = function() {
            Manager.get_competitions($scope.creDate.competitions, function(res) {
                $scope.competitions = res.data;
                //$scope.creDate.competitions = $scope.users[0].creDate;
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.delete_competition = function(id, i) {
            Manager.delete_competition(id, function(res) {
                $scope.competitions.splice(i, 1);
            }, function(res) {
                console.error(res.data);
            });
        };
        Manager.get($routeParams.id, function(res) {
            $scope.manager = res.data;
            switch (true) {
                case $scope.manager.permission.articles:
                    $scope.page = 'article';
                    $scope.get_articles();
                    break;
                case $scope.manager.permission.users:
                    $scope.page = 'users';
                    $scope.get_users();
                    break;
                case $scope.manager.permission.photos:
                    $scope.page = 'photos';
                    $scope.get_photos();
                    break;
                case $scope.manager.permission.videos:
                    $scope.page = 'videos';
                    $scope.get_videos();
                    break;
                case $scope.manager.permission.topics:
                    $scope.page = 'topics';
                    $scope.get_topics();
                    break;
                case $scope.manager.permission.contests:
                    $scope.page = 'contests';
                    $scope.get_contests();
                    break;
                case $scope.manager.permission.hobbies:
                    $scope.page = 'hobbies';
                    $scope.get_hobbies();
                    break;
                case $scope.manager.permission.sports:
                    $scope.page = 'sports';
                    $scope.get_sports();
                    break;
                case $scope.manager.permission.managers:
                    $scope.page = 'managers';
                    $scope.get_managers();
                    break;
                case $scope.manager.permission.competitions:
                    $scope.page = 'competitions';
                    $scope.get_competitions();
                    break;
                default:
                    $location.path('/manager/signin');
                    break;
            }
        }, function(res) {
            console.error(res.data);
        });
    }
]);