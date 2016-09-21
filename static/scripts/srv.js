angular.module('Services', []).factory('User', ['$http',
	function($http) {
		return {
			get: function(s, e) {
				return $http.get('/user').then(s, e);
			},
			add_university: function(id, opt, s, e) {
				return $http.put('/user/' + id + '/add_university', opt).then(s, e);
			},
			rm_university: function(id, opt, s, e) {
				return $http.put('/user/' + id + '/add_university', opt).then(s, e);
			},
			add_workplace: function(id, opt, s, e) {
				return $http.put('/user/' + id + '/add_workplace', opt).then(s, e);
			},
			rm_workplace: function(id, opt, s, e) {
				return $http.put('/user/' + id + '/add_workplace', opt).then(s, e);
			},
			load: function(id, s, e) {
				return $http.get('/user/' + id).then(s, e);
			},
			set: function(options, s, e) {
				return $http.put('/user', options).then(s, e);
			},
			auth: function(credentials, s, e) {
				return $http.post('/auth', credentials).then(s, e);
			},
			pin: function(cred, s, e) {
				return $http.get('/pin/' + cred.mail + '/' + cred.pin).then(s, e);
			},
			find_users: function(search, s, e) {
				return $http.post('/find_users', search).then(s, e);
			}
		};
	}
]).factory('Dialog', ['$http',
	function($http) {
		return {
			get: function(s, e) {
				return $http.get('/dialog/all').then(s, e);
			},
			check: function(id, s, e) {
				return $http.get('/checkdlg/' + id).then(s, e);
			},
			create: function(opt, s, e) {
				return $http.post('/dialog', opt).then(s, e);
			},
			delete: function(id, s, e) {
				return $http.delete('/dialog/' + id).then(s, e);
			},
			add_message: function(id, opt, s, e) {
				return $http.put('/dialog/' + id, opt).then(s, e);
			}
		};
	}
]).factory('VK', ['$http',
	function($http) {
		return {
			get_countries: function(s, e) {
				return $http.post('vk/database.getCountries', {}).then(s, e);
			},
			get_cities: function(opt, s, e) {
				return $http.post('vk/database.getCities', opt).then(s, e);
			},
			get_universities: function(opt, s, e) {
				return $http.post('vk/database.getUniversities', opt).then(s, e);
			},
			get_faculties: function(opt, s, e) {
				return $http.post('vk/database.getFaculties', opt).then(s, e);
			},
			get_chairs: function(opt, s, e) {
				return $http.post('vk/database.getChairs', opt).then(s, e);
			},
		}
	}
]).factory('Topic', ['$http',
	function($http) {
		return {
			get: function(id, s, e) {
				return $http.get('/topic/' + id).then(s, e);
			},
			new: function(opt, s, e) {
				return $http.post('/topic/new', opt).then(s, e);
			},
			edit: function(opt, s, e) {
				return $http.put('/topic/' + opt._id, opt).then(s, e);
			},
			add_like: function(opt, s, e) {
				return $http.put('/topic/' + opt._id + '/add_like').then(s, e);
			},
			remove_like: function(opt, s, e) {
				return $http.put('/topic/' + opt._id + '/remove_like').then(s, e);
			},
			add_comment: function(opt, s, e) {
				return $http.put('/topic/' + opt._id + '/add_comment', opt).then(s, e);
			},
			remove_comment: function(opt, s, e) {
				return $http.put('/topic/' + opt._id + '/remove_comment', opt).then(s, e);
			}
		};
	}
]).factory('Photo', ['$http',
	function($http) {
		return {
			get: function(id, s, e) {
				return $http.get('/photo/' + id).then(s, e);
			},
			edit: function(opt, s, e) {
				return $http.put('/photo/' + opt._id, opt).then(s, e);
			},
			delete: function(id, s, e) {
				return $http.delete('/photo/' + id).then(s, e);
			},
			add_like: function(p, s, e) {
				return $http.put('/photo/' + p._id + '/add_like').then(s, e);
			},
			remove_like: function(p, s, e) {
				return $http.put('/photo/' + p._id + '/remove_like').then(s, e);
			},
			add_comment: function(opt, s, e) {
				return $http.put('/photo/' + opt._id + '/add_comment', opt).then(s, e);
			},
			remove_comment: function(opt, s, e) {
				return $http.put('/photo/' + opt._id + '/remove_comment', opt).then(s, e);
			}
		};
	}
]).factory('Video', ['$http',
	function($http) {
		return {
			get: function(id, s, e) {
				return $http.get('/video/' + id).then(s, e);
			},
			add: function(opt, s, e) {
				return $http.post('/video/new', opt).then(s, e);
			},
			edit: function(opt, s, e) {
				return $http.put('/video/' + opt._id, opt).then(s, e);
			},
			delete: function(id, s, e) {
				return $http.delete('/video/' + id).then(s, e);
			},
			add_like: function(p, s, e) {
				return $http.put('/video/' + p._id + '/add_like').then(s, e);
			},
			remove_like: function(p, s, e) {
				return $http.put('/video/' + p._id + '/remove_like').then(s, e);
			},
			add_comment: function(opt, s, e) {
				return $http.put('/video/' + opt._id + '/add_comment', opt).then(s, e);
			},
			remove_comment: function(opt, s, e) {
				return $http.put('/video/' + opt._id + '/remove_comment', opt).then(s, e);
			}
		};
	}
]).factory('Album', ['$http',
	function($http) {
		return {
			get: function(id, s, e) {
				return $http.get('/album/' + id).then(s, e);
			},
			get_one: function(id, s, e) {
				return $http.get('/single_album/' + id).then(s, e);
			},
			create: function(title, s, e) {
				return $http.post('/album/new', {
					title: title
				}).then(s, e);
			},
			set_title: function(opt, s, e) {
				return $http.put('/album/' + opt._id, opt).then(s, e);
			},
			add_photo: function(opt, s, e) {
				return $http.put('/album/' + opt._id + '/add_photo/' + opt.photoid, opt).then(s, e);
			},
			remove_photo: function(opt, s, e) {
				return $http.put('/album/' + opt._id + '/remove_photo/' + opt.photoid, opt).then(s, e);
			},
			delete: function(id, s, e) {
				return $http.delete('/album/' + id).then(s, e);
			}
		};
	}
]).factory('MSG', function() {
	return {
		ok: function(msg) {
			swal('OK!', msg);
		},
		info: function(msg) {
			swal('Info!', msg, 'info');
		},
		warn: function(msg) {
			swal('Warning!', msg, 'warning');
		},
		err: function(msg) {
			swal('Error!', msg, 'error');
		},
		custom: function(opt, cb) {
			swal(opt, cb);
		}
	};
}).factory('LS', function() {
	return {
		get: function(item) {
			try {
				var item = localStorage.getItem(item);
				if (item) {
					return JSON.parse(item);
				} else {
					return null;
				}
			} catch (e) {
				console.error(e);
				return null;
			}
		},
		set: function(item, object) {
			try {
				var obj = object ? JSON.stringify(object) : '';
				localStorage.setItem(item, obj);
				return true;
			} catch (e) {
				localStorage.clear();
				console.error(e);
				return false;
			}
		}
	};
}).factory('socket', function($rootScope) {
	var socket = io();
	return {
		on: function(eventName, callback) {
			socket.on(eventName, function() {
				var args = arguments;
				$rootScope.$apply(function() {
					callback.apply(socket, args);
				});
			});
		},
		emit: function(eventName, data, callback) {
			socket.emit(eventName, data, function() {
				var args = arguments;
				$rootScope.$apply(function() {
					if (callback) {
						callback.apply(socket, args);
					}
				});
			})
		}
	};
});
