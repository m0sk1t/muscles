angular.module('Services', []).factory('User', ['$http',
	function($http) {
		return {
			get: function(s, e) {
				return $http.get('/user').then(s, e);
			},
			get_favs: function(s, e) {
				return $http.get('/favs').then(s, e);
			},
			get_hobbies: function(s, e) {
				return $http.get('/hobbies').then(s, e);
			},
			get_sports: function(s, e) {
				return $http.get('/sports').then(s, e);
			},
			get_contest: function(id, s, e) {
				return $http.get('/contest/' + id).then(s, e);
			},
			add_contest_participant: function(id, s, e) {
				return $http.put('/contest/' + id + '/add_participant').then(s, e);
			},
			add_paid_like: function(id, pid, s, e) {
				return $http.put('/contest/' + id + '/add_paid_like/' + pid).then(s, e);
			},
			add_free_like: function(id, pid, s, e) {
				return $http.put('/contest/' + id + '/add_free_like/' + pid).then(s, e);
			},
			rm_contest_participant: function(id, s, e) {
				return $http.put('/contest/' + id + '/rm_participant').then(s, e);
			},
			get_competition: function(id, s, e) {
				return $http.get('/competition/' + id).then(s, e);
			},
			add_mark: function(opt, s, e) {
				return $http.put('/user/add_mark/' + opt.id, opt).then(s, e);
			},
			rm_mark: function(opt, s, e) {
				return $http.put('/user/rm_mark/' + opt.id, opt).then(s, e);
			},
			add_university: function(opt, s, e) {
				return $http.put('/user/add_university', opt).then(s, e);
			},
			rm_university: function(opt, s, e) {
				return $http.put('/user/rm_university', opt).then(s, e);
			},
			add_workplace: function(opt, s, e) {
				return $http.put('/user/add_workplace', opt).then(s, e);
			},
			rm_workplace: function(opt, s, e) {
				return $http.put('/user/rm_workplace', opt).then(s, e);
			},
			add_achievement: function(opt, s, e) {
				return $http.put('/user/add_achievement', opt).then(s, e);
			},
			rm_achievement: function(opt, s, e) {
				return $http.put('/user/rm_achievement', opt).then(s, e);
			},
			add_hobbie: function(opt, s, e) {
				return $http.put('/user/add_hobbie', opt).then(s, e);
			},
			rm_hobbie: function(opt, s, e) {
				return $http.put('/user/rm_hobbie', opt).then(s, e);
			},
			add_sport: function(opt, s, e) {
				return $http.put('/user/add_sport', opt).then(s, e);
			},
			rm_sport: function(opt, s, e) {
				return $http.put('/user/rm_sport', opt).then(s, e);
			},
			load: function(id, s, e) {
				return $http.get('/user/' + id).then(s, e);
			},
			set: function(options, s, e) {
				return $http.put('/user', options).then(s, e);
			},
			signup: function(credentials, s, e) {
				return $http.post('/signup', credentials).then(s, e);
			},
			signin: function(credentials, s, e) {
				return $http.post('/auth/local', credentials).then(s, e);
			},
			changepwd: function(credentials, s, e) {
				return $http.put('/changepwd', credentials).then(s, e);
			},
			unlink: function(provider, s, e) {
				return $http.put('/unlink/' + provider).then(s, e);
			},
			search: function(search, s, e) {
				return $http.post('/user/search', search).then(s, e);
			}
		};
	}
]).factory('Manager', ['$http',
	function($http) {
		return {
			all: function(s, e) {
				return $http.get('/manager/all').then(s, e);
			},
			get: function(id, s, e) {
				return $http.get('/manager/' + id).then(s, e);
			},
			signin: function(opt, s, e) {
				return $http.post('/manager/signin', opt).then(s, e);
			},
			create: function(opt, s, e) {
				return $http.post('/manager/new', opt).then(s, e);
			},
			delete: function(id, s, e) {
				return $http.delete('/manager/' + id).then(s, e);
			},
			set_permission: function(id, opt, s, e) {
				return $http.put('/manager/' + id, opt).then(s, e);
			},
			create_article: function(s, e) {
				return $http.post('/manage/article/new', {}).then(s, e);
			},
			create_contest: function(s, e) {
				return $http.post('/manage/contest/new', {}).then(s, e);
			},
			create_competition: function(s, e) {
				return $http.post('/manage/competition/new', {}).then(s, e);
			},
			create_hobbie: function(opt, s, e) {
				return $http.post('/manage/hobbie/new', opt).then(s, e);
			},
			create_sport: function(opt, s, e) {
				return $http.post('/manage/sport/new', opt).then(s, e);
			},
			update_article: function(id, opt, s, e) {
				return $http.put('/manage/article/' + id, opt).then(s, e);
			},
			update_contest: function(id, opt, s, e) {
				return $http.put('/manage/contest/' + id, opt).then(s, e);
			},
			update_competition: function(id, opt, s, e) {
				return $http.put('/manage/competition/' + id, opt).then(s, e);
			},
			update_hobbie: function(id, opt, s, e) {
				return $http.put('/manage/hobbie/' + id, opt).then(s, e);
			},
			update_sport: function(id, opt, s, e) {
				return $http.put('/manage/sport/' + id, opt).then(s, e);
			},
			update_user: function(id, user, s, e) {
				return $http.put('/manage/user/' + id, user).then(s, e);
			},
			get_article: function(id, s, e) {
				return $http.get('/manage/article/' + id).then(s, e);
			},
			get_contest: function(id, s, e) {
				return $http.get('/manage/contest/' + id).then(s, e);
			},
			get_competition: function(id, s, e) {
				return $http.get('/manage/competition/' + id).then(s, e);
			},
			get_articles: function(credate, s, e) {
				return $http.get('/manage/articles/' + credate).then(s, e);
			},
			get_contests: function(credate, s, e) {
				return $http.get('/manage/contests/' + credate).then(s, e);
			},
			get_competitions: function(credate, s, e) {
				return $http.get('/manage/competitions/' + credate).then(s, e);
			},
			get_hobbies: function(s, e) {
				return $http.get('/hobbies').then(s, e);
			},
			get_sports: function(s, e) {
				return $http.get('/sports').then(s, e);
			},
			get_photos: function(credate, s, e) {
				return $http.get('/manage/photos/' + credate).then(s, e);
			},
			get_users: function(credate, s, e) {
				return $http.get('/manage/users/' + credate).then(s, e);
			},
			get_videos: function(credate, s, e) {
				return $http.get('/manage/videos/' + credate).then(s, e);
			},
			get_topics: function(credate, s, e) {
				return $http.get('/manage/topics/' + credate).then(s, e);
			},
			delete_article: function(id, s, e) {
				return $http.delete('/manage/article/' + id).then(s, e);
			},
			delete_competition: function(id, s, e) {
				return $http.delete('/manage/competition/' + id).then(s, e);
			},
			delete_contest: function(id, s, e) {
				return $http.delete('/manage/contest/' + id).then(s, e);
			},
			delete_hobbie: function(id, s, e) {
				return $http.delete('/manage/hobbie/' + id).then(s, e);
			},
			delete_sport: function(id, s, e) {
				return $http.delete('/manage/sport/' + id).then(s, e);
			},
			delete_photo: function(id, s, e) {
				return $http.delete('/manage/photo/' + id).then(s, e);
			},
			delete_video: function(id, s, e) {
				return $http.delete('/manage/video/' + id).then(s, e);
			},
			delete_user: function(id, s, e) {
				return $http.delete('/manage/user/' + id).then(s, e);
			},
			delete_topic: function(id, s, e) {
				return $http.delete('/manage/topic/' + id).then(s, e);
			},
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
]).factory('$vk', ['$http', '$q',
	function($http, $q) {
		return {
			status: function() {
				var defer = $q.defer();
				VK.Auth.getLoginStatus(function(res) {
					(res) ? defer.resolve(res): defer.reject('response error');
				});
				return defer.promise;
			},
			login: function() {
				var defer = $q.defer();
				VK.Auth.login(function(res) {
					(res) ? defer.resolve(res): defer.reject('response error');
				});
				return defer.promise;
			},
			call: function(method, params) {
				var defer = $q.defer();
				VK.Api.call(method, params, function(res) {
					(res) ? defer.resolve(res): defer.reject('response error');
				});
				return defer.promise;
			},
			get_countries: function(s, e) {
				return $http.post('vk/database.getCountries', {}).then(s, e);
			},
			get_cities: function(opt, s, e) {
				opt.count = 333;
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
			del: function(id, s, e) {
				return $http.delete('/topic/' + id).then(s, e);
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
}).factory('notify', function() {
	var a = new Audio('alarm.mp3');
	return {
		play: function() {
			a.play();
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
