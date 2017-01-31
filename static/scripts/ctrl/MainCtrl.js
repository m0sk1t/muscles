angular.module('MuscleMan').controller('MainCtrl', ['$scope', '$location', 'socket', 'User', 'LS', 'MSG', 'notify',
    function($scope, $location, socket, User, LS, MSG, notify) {
        $scope.cred = {
            mail: '',
            pass: ''
        };
        $scope.options = {
            user: LS.get('user') || 0
        };

        $scope.signin = function() {
            if ($scope.cred.mail.$error) return;
            $scope.options.loading = true;
            User.signin($scope.cred, function(res) {
                console.log(res.data);
                LS.set('user', res.data);
                $scope.options.loading = false;
                $scope.options.user = res.data;
                $location.path('/user/' + $scope.options.user._id);
                socket.emit('user:online', { id: $scope.options.user._id });
            }, function(res) {
                $scope.options.loading = false;
                if (res.status === 401) {
                    MSG.err('Неверный логин или пароль!');
                    return;
                }
            });
        };

        $scope.getloc = function() {
            return location.hash === '#/';
        };

        $scope.options.user && socket.emit('user:online', {
            id: $scope.options.user._id
        });

        socket.on('new:message', function(data) {
            console.log('new:message');
            console.log(data);
            if (
                Notification.permission !== 'denied' &&
                $scope.options.user.settings.show_notifications
            ) {
                var n = new Notification('У вас новое сообщение!', {
                    icon: data.avatar,
                    body: data.fio + ' сказал' + data.text
                });
                notify.play();
                setTimeout(n.close.bind(n), 3000);
            }
        });

        socket.on('photo:comment', function(data) {
            console.log('photo:comment');
            console.log(data);
            if (
                Notification.permission !== 'denied' &&
                $scope.options.user.settings.show_notifications
            ) {
                var n = new Notification('У вашего фото новый комментарий!', {
                    icon: data.avatar,
                    body: data.name + ' ' + data.surname + ' сказал' + data.comment
                });
                notify.play();
                setTimeout(n.close.bind(n), 3000);
            }
        });

        socket.on('video:comment', function(data) {
            console.log('video:comment');
            console.log(data);
            if (
                Notification.permission !== 'denied' &&
                $scope.options.user.settings.show_notifications
            ) {
                var n = new Notification('У вашего видео новый комментарий!', {
                    icon: data.avatar,
                    body: data.name + ' ' + data.surname + ' сказал' + data.comment
                });
                notify.play();
                setTimeout(n.close.bind(n), 3000);
            }
        });

        $scope.getloc = function() {
            return location.hash === '#/';
        };

        //		$scope.options.user._id && (location.hash = '#/user/' + $scope.options.user._id);

        !!$scope.options.user && User.get(function(res) {
            $scope.options.user = res.data;
            LS.set('user', res.data);
            //$location.path('/user/' + $scope.options.user._id);
        }, function(res) {
            $location.path('/signup');
        });

        $scope.$on('new_message', function(ev, data) {
            socket.emit('new:message', data);
        });

        $scope.$on('user_save', function() {
            User.set($scope.options.user, function(res) {
                LS.set('user', $scope.options.user);
                console.log('User saved!');
            }, function(res) {
                console.error(res.data);
            });
        });
    }
]);