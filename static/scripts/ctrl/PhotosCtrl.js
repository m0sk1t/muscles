angular.module('MuscleMan').controller('PhotosCtrl', ['$scope', 'Upload', 'Photo',
	function($scope, Upload, Photo) {
		$scope.photos = [];

		Photo.get('all', function(res) {
			$scope.photos = res.data;
		}, function(res) {
			console.error(res.data);
		});

		$scope.delete_photo = function(photo) {
			Photo.delete(photo, function(res) {
				$scope.photos = $scope.photos.filter(function(el) {
					return el._id !== photo;
				});
			}, function(res) {
				console.error(res.data);
			});
		};

		$scope.uploadFiles = function(files) {
			if (files && files.length) {
				for (var i = 0; i < files.length; i++) {
					Upload.upload({
						url: '/photo/new',
						data: {
							file: files[i]
						}
					}).then(function(res) {
						$scope.photos.push(res.data);
					});
				}
			}
		};
	}
]);
