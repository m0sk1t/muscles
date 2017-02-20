angular.module('MuscleMan').controller('FavsCtrl', ['$scope', 'MSG', 'User', 'Dialog',
    function($scope, MSG, User, Dialog) {
        $scope.favs = [];

        User.get_favs(function(res) {
            $scope.favs = res.data;
        }, function(res) {
            console.error(res.data);
        });

        User.get_sports(function(res) {
            $scope.sports = res.data;
        }, function(res) {
            MSG.err(res.data);
        });

        User.get_hobbies(function(res) {
            $scope.hobbies = res.data;
        }, function(res) {
            MSG.err(res.data);
        });

        $scope.send_message = function(data) {
            $scope.$emit('new_message', data);
        };

        $scope.remove_from_fav = function(id) {
            $scope.options.user.favs = $scope.options.user.favs.filter(function(el) {
                return el.id !== id;
            });
            $scope.favs = $scope.favs.filter(function(el) {
                return el._id !== id;
            });
            $scope.$emit('user_save');
        };
        $scope.add_comment = function(id) {
            var l = $scope.options.user.favs.length;
            MSG.custom({
                title: 'Ваш комментарий',
                text: 'введите ниже',
                type: 'input',
                showCancelButton: true,
                closeOnConfirm: true,
            }, function(comment) {
                if (!comment) return;
                for (; l--;) {
                    if ($scope.options.user.favs[l].id === id) {
                        $scope.options.user.favs[l].comment = comment;
                    }
                }
                $scope.$emit('user_save');
            });
        };

        $scope.get_user_comment = function(id) {
            if (!$scope.options.user.favs.length) return;
            return $scope.options.user.favs.filter(function(el) {
                return el.id === id;
            })[0].comment;
        };

        $scope.write_message = function(user) {
            MSG.custom({
                title: "Новое сообщение!",
                text: 'Введите текст сообщения',
                type: 'input',
                showCancelButton: true,
                closeOnConfirm: true,
            }, function(text) {
                if (text) {
                    var dlg = {
                            addressee: {
                                id: user._id,
                                avatar: user.avatar,
                                fio: user.name + ' ' + user.surname,
                            },
                            message: {
                                text: text,
                                t: Date.now(),
                                uid: $scope.options.user._id,
                            }
                        },
                        msg = {
                            message: text,
                            target: user._id,
                            avatar: $scope.options.user.avatar,
                            fio: $scope.options.user.name + ' ' + $scope.options.user.surname,
                        };
                    Dialog.check(user._id, function(res) {
                        Dialog.add_message(res.data._id, {
                            addressee: user._id,
                            message: dlg.message,
                        }, function(res) {
                            $scope.send_message(msg);
                            $location.path('/dialogs');
                        }, function(res) {
                            console.error(res.data);
                        });
                    }, function(res) {
                        Dialog.create(dlg, function(res) {
                            $scope.send_message(msg);
                            $location.path('/dialogs');
                        }, function(res) {
                            console.error(res.data);
                        });
                    });
                } else {
                    swal.showInputError('Введите хоть что-нибудь...');
                }
            });
        };
    }
]);