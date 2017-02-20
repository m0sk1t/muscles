angular.module('MuscleMan').controller('DialogsCtrl', ['$scope', 'Dialog',
    function($scope, Dialog) {
        $scope.dialog = '';
        $scope.message = '';
        $scope.dialogs = [];
        $scope.messages = [];
        Dialog.get(function(res) {
            $scope.dialogs = res.data;
            $scope.set_messages($scope.dialogs[0], 0);
        }, function(res) {
            console.error(res.data);
        });
        $scope.format_date = function(date) {
            return moment(date).format('DD.MM.YYYY');
        };
        $scope.set_messages = function(d, i) {
            $scope.messages = d.messages;
            $scope.dialogIndex = i;
            $scope.dialog = d._id;
            $scope.message = '';
        };
        $scope.check_enter = function(e) {
            e.keyCode === 13 && $scope.add_message();
        };
        $scope.add_message = function() {
            if (!$scope.message) return;
            var message = {
                    t: Date.now(),
                    text: $scope.message,
                    uid: $scope.options.user._id
                },
                addressee = $scope.dialogs[$scope.dialogIndex].users.filter(function(el) {
                    return el.id !== $scope.options.user._id;
                })[0];

            Dialog.add_message($scope.dialog, {
                message: message,
                addressee: addressee
            }, function(res) {
                $scope.$emit('new_message', {
                    target: addressee.id,
                    message: message.text,
                    t: new Date(),
                    avatar: $scope.options.user.avatar,
                    fio: $scope.options.user.name + ' ' + $scope.options.user.surname,
                });
                $scope.dialogs[$scope.dialogIndex].messages.push(message);
                $scope.message = '';
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.delete_dialog = function(d, i) {
            Dialog.delete(d._id, function(res) {
                $scope.messages = [];
                $scope.dialogs.splice(i, 1);
            }, function(res) {
                console.error(res.data);
            });
        };
        $scope.detect_user = function(d, id) {
            if (!d) return '';
            var user = d.users.filter(function(el) {
                return el.id === id;
            })[0];
            return (user ? user : '');
        };
        $scope.with_user = function(d) {
            if (!d) return '';
            return d.users.filter(function(el) {
                return el.id !== $scope.options.user._id;
            })[0];
        };
    }
]);