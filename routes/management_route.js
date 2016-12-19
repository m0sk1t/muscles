module.exports = (app) => {
	var salt = 'N&*ud91)(R#@10(!)',
		crypto = require('crypto'),
		cloudinary = require('./cloudinary'),
		User = require('../models/User'),
		Video = require('../models/Video'),
		Photo = require('../models/Photo'),
		Topic = require('../models/Topic'),
		Sport = require('../models/Sport'),
		Hobbie = require('../models/Hobbie'),
		Manager = require('../models/Manager'),
		Article = require('../models/Article'),
		Contest = require('../models/Contest'),
		Competition = require('../models/Competition');

	/*
		Manager routes
	*/
	var management_check = function(req, res, next) {
		if (!req.cookies.manager_uid) {
			res.status(403).send('You shall not pass!');
			return console.error('You shall not pass!');
		}
		Manager.findOne({
			manager_uid: req.cookies.manager_uid
		}, (err, manager) => {
			if (err || !manager) return console.error(err || 'There is no manager');
			req.manager = manager;
			next();
		});
	};
	app.post('/manager/signin', (req, res) => {
		var manager_uid = crypto.createHash('sha256').update(req.body.login + salt + req.body.password).digest('hex');
		console.log(manager_uid)
		Manager.findOne({
			manager_uid: manager_uid
		}, (err, manager) => {
			if (err || !manager) return res.status(500).json(err || {
				error: 'Wrong credentials'
			});
			res.cookie('manager_uid', manager_uid, {
				expires: new Date(Date.now() + 1000 * 60 * 60 * 24 * 365 * 10),
				httpOnly: true,
				path: '/'
			}).json(manager);
		})
	});
	app.route('/manager/:id')
		.get(management_check, (req, res) => {
			if (req.params.id === 'all') {
				req.manager.permission.managers ? Manager.find({}, (err, managers) => {
					if (err) return console.error(err);
					res.json(managers);
				}) : res.status(403).send('Permission denied');
			} else {
				res.json(req.manager);
			}
		})
		.put(management_check, (req, res) => {
			req.manager.permission.managers ? Manager.findByIdAndUpdate(req.params.id, {
				$set: {
					permission: req.body
				}
			}, (err, manager) => {
				if (err) return console.error(err);
				res.json(manager);
			}) : res.status(403).send('Permission denied');
		})
		.post(management_check, (req, res) => {
			if (req.manager.permission.managers) {
				var manager = new Manager(),
					manager_uid = crypto.createHash('sha256').update(req.body.login + salt + req.body.password).digest('hex');
				manager.login = req.body.login;
				manager.manager_uid = manager_uid;
				manager.save((err) => {
					if (err) return console.error(err);
					res.json(manager);
				});
			} else {
				res.status(403).send('Permission denied');
			}
		})
		.delete(management_check, (req, res) => {
			(req.manager.permission.managers || req.manager.id === req.params.id) ? Manager.findByIdAndRemove(req.params.id, (err, manager) => {
				if (err) return console.error(err);
				res.json(manager);
			}): res.status(403).send('Permission denied');
		});

	/*
		User routes
	*/
	app.get('/manage/users/:credate', management_check, (req, res) => {
		User.find({
			creDate: {
				$lt: req.params.credate
			}
		}) /*.limit(3)*/ .sort({
			creDate: -1
		}).exec((err, users) => {
			if (err) return console.error(err);
			res.json(users);
		});
	});
	app.route('/manage/user/:id')
		.delete(management_check, (req, res) => {
			req.manager.permission.users ? User.findByIdAndRemove(req.params.id, (err, user) => {
				if (err) return console.error(err);
				res.json(user);
			}) : res.status(403).send('Permission denied');
		})
		.put(management_check, (req, res) => {
			req.manager.permission.users ? User.findByIdAndUpdate(req.params.id, {
				$set: {
					workplaces: req.body.workplaces,
					achievements: req.body.achievements,
					universities: req.body.universities,
				}
			}, (err, user) => {
				if (err) return console.error(err);
				res.json(user);
			}) : res.status(403).send('Permission denied');
		});

	/*
		Photo routes
	*/
	app.get('/manage/photos/:credate', management_check, (req, res) => {
		Photo.find({
			creDate: {
				$lt: req.params.credate
			}
		}) /*.limit(3)*/ .sort({
			creDate: -1
		}).exec((err, photos) => {
			if (err) return console.error(err);
			res.json(photos);
		});
	});
	app.delete('/manage/photo/:id', management_check, (req, res) => {
		req.manager.permission.photos ? Photo.findByIdAndRemove(req.params.id, (err, photo) => {
			if (err) return console.error(err);
			cloudinary.delete_image(photo.image.split('/').pop().split('.')[0], (result) => {
				res.json(result);
			});
		}) : res.status(403).send('Permission denied');
	});

	/*
		Video routes
	*/
	app.get('/manage/videos/:credate', management_check, (req, res) => {
		Video.find({
			creDate: {
				$lt: req.params.credate
			}
		}) /*.limit(3)*/ .sort({
			creDate: -1
		}).exec((err, videos) => {
			if (err) return console.error(err);
			res.json(videos);
		});
	});
	app.delete('/manage/video/:id', management_check, (req, res) => {
		req.manager.permission.videos ? Video.findByIdAndRemove(req.params.id, (err, video) => {
			if (err) return console.error(err);
			res.json(video);
		}) : res.status(403).send('Permission denied');
	});

	/*
		Topic routes
	*/
	app.get('/manage/topics/:credate', management_check, (req, res) => {
		Topic.find({
			creDate: {
				$lt: req.params.credate
			}
		}) /*.limit(3)*/ .sort({
			creDate: -1
		}).exec((err, topics) => {
			if (err) return console.error(err);
			res.json(topics);
		});
	});
	app.delete('/manage/topic/:id', management_check, (req, res) => {
		req.manager.permission.topics ? Topic.findByIdAndRemove(req.params.id, (err, topic) => {
			if (err) return console.error(err);
			res.json(topic);
		}) : res.status(403).send('Permission denied');
	});

	/*
		Hobbie routes
	*/
	app.route('/manage/hobbie/:id')
		.put(management_check, (req, res) => {
			req.manager.permission.hobbies ? Hobbie.findByIdAndUpdate(req.params.id, {
				$set: req.body
			}, (err, manager) => {
				if (err) return console.error(err);
				res.json(manager);
			}) : res.status(403).send('Permission denied');
		})
		.post(management_check, (req, res) => {
			if (req.manager.permission.hobbies) {
				var hobbie = new Hobbie();
				hobbie.item = req.body.item;
				hobbie.type = req.body.type;
				hobbie.save((err) => {
					res.json(hobbie);
				});
			} else {
				res.status(403).send('Permission denied');
			}
		})
		.delete(management_check, (req, res) => {
			req.manager.permission.hobbies ? Hobbie.findByIdAndRemove(req.params.id, (err, hobbie) => {
				if (err) return console.error(err);
				res.json(hobbie);
			}) : res.status(403).send('Permission denied');
		});

	/*
		Sport routes
	*/
	app.route('/manage/sport/:id')
		.put(management_check, (req, res) => {
			req.manager.permission.sports ? Sport.findByIdAndUpdate(req.params.id, {
				$set: req.body
			}, (err, manager) => {
				if (err) return console.error(err);
				res.json(manager);
			}) : res.status(403).send('Permission denied');
		})
		.post(management_check, (req, res) => {
			if (req.manager.permission.sports) {
				var sport = new Sport();
				sport.sex = req.body.sex;
				sport.sport = req.body.sport;
				sport.save((err) => {
					res.json(sport);
				});
			} else {
				res.status(403).send('Permission denied');
			}
		})
		.delete(management_check, (req, res) => {
			req.manager.permission.sports ? Sport.findByIdAndRemove(req.params.id, (err, sport) => {
				if (err) return console.error(err);
				res.json(sport);
			}) : res.status(403).send('Permission denied');
		});

	/*
		Article routes
	*/
	app.get('/manage/articles/:credate', management_check, (req, res) => {
		Article.find({
			creDate: {
				$lt: req.params.credate
			}
		}) /*.limit(3)*/ .sort({
			creDate: -1
		}).exec((err, articles) => {
			if (err) return console.error(err);
			res.json(articles);
		});
	});
	app.route('/manage/article/:id')
		.get(management_check, (req, res) => {
			req.manager.permission.articles ? Article.findById(req.params.id, (err, article) => {
				res.json(article);
			}) : res.status(403).send('Permission denied');
		})
		.put(management_check, (req, res) => {
			req.manager.permission.articles ? Article.findByIdAndUpdate(req.params.id, {
				$set: {
					title: req.body.title,
					text: req.body.text
				}
			}, (err, article) => {
				res.json(article);
			}) : res.status(403).send('Permission denied');
		})
		.post(management_check, (req, res) => {
			if (req.manager.permission.articles) {
				var article = new Article();
				article.text = req.body.text;
				article.creDate = new Date();
				article.title = req.body.title;
				article.owner = req.manager._id;
				article.save((err) => {
					res.json(article);
				});
			} else {
				res.status(403).send('Permission denied');
			}
		})
		.delete(management_check, (req, res) => {
			req.manager.permission.articles ? Article.findByIdAndRemove(req.params.id, (err, article) => {
				if (err) return console.error(err);
				res.json(article);
			}) : res.status(403).send('Permission denied');
		});

	/*
		Contest routes
	*/
	app.get('/manage/contests/:credate', management_check, (req, res) => {
		Contest.find({
			creDate: {
				$lt: req.params.credate
			}
		}) /*.limit(3)*/ .sort({
			creDate: -1
		}).exec((err, contests) => {
			if (err) return console.error(err);
			res.json(contests);
		});
	});
	app.route('/manage/contest/:id')
		.get(management_check, (req, res) => {
			req.manager.permission.contests ? Contest.findById(req.params.id, (err, contest) => {
				res.json(contest);
			}) : res.status(403).send('Permission denied');
		})
		.put(management_check, (req, res) => {
			req.manager.permission.contests ? Contest.findByIdAndUpdate(req.params.id, {
				$set: {
					type: req.body.type,
					title: req.body.title,
					prize: req.body.prize,
					dateEnd: req.body.dateEnd,
					dateStart: req.body.dateStart,
					freeVoices: req.body.freeVoices,
					paidVoices: req.body.paidVoices,
					description: req.body.description,
					participants: req.body.participants
				}
			}, (err, contest) => {
				res.json(contest);
			}) : res.status(403).send('Permission denied');
		})
		.post(management_check, (req, res) => {
			if (req.manager.permission.contests) {
				var contest = new Contest();
				contest.type = req.body.type;
				contest.creDate = new Date();
				contest.title = req.body.title;
				contest.prize = req.body.prize;
				contest.owner = req.manager._id;
				contest.dateEnd = req.body.dateEnd;
				contest.dateStart = req.body.dateStart;
				contest.freeVoices = req.body.freeVoices;
				contest.paidVoices = req.body.paidVoices;
				contest.description = req.body.description;
				contest.participants = req.body.participants;
				contest.save((err) => {
					res.json(contest);
				});
			} else {
				res.status(403).send('Permission denied');
			}
		})
		.delete(management_check, (req, res) => {
			req.manager.permission.contests ? Contest.findByIdAndRemove(req.params.id, (err, contest) => {
				if (err) return console.error(err);
				res.json(contest);
			}) : res.status(403).send('Permission denied');
		});

	/*
		Competition routes
	*/
	app.get('/manage/competitions/:credate', management_check, (req, res) => {
		Competition.find({
			creDate: {
				$lt: req.params.credate
			}
		}) /*.limit(3)*/ .sort({
			creDate: -1
		}).exec((err, competitions) => {
			if (err) return console.error(err);
			res.json(competitions);
		});
	});
	app.route('/manage/competition/:id')
		.get(management_check, (req, res) => {
			req.manager.permission.competitions ? Competition.findById(req.params.id, (err, competition) => {
				res.json(competition);
			}) : res.status(403).send('Permission denied');
		})
		.put(management_check, (req, res) => {
			req.manager.permission.competitions ? Competition.findByIdAndUpdate(req.params.id, {
				$set: {
					date: req.body.date,
					city: req.body.city,
					place: req.body.place,
					title: req.body.title,
					nomination: req.body.nomination,
					description: req.body.description,
				}
			}, (err, competition) => {
				res.json(competition);
			}) : res.status(403).send('Permission denied');
		})
		.post(management_check, (req, res) => {
			if (req.manager.permission.competitions) {
				var competition = new Competition();
				competition.date = req.body.date;
				competition.creDate = new Date();
				competition.city = req.body.city;
				competition.place = req.body.place;
				competition.title = req.body.title;
				competition.nomination = req.body.nomination;
				competition.description = req.body.description;
				competition.owner = req.manager._id;
				competition.save((err) => {
					res.json(competition);
				});
			} else {
				res.status(403).send('Permission denied');
			}
		})
		.delete(management_check, (req, res) => {
			req.manager.permission.competitions ? Competition.findByIdAndRemove(req.params.id, (err, competition) => {
				if (err) return console.error(err);
				res.json(competition);
			}) : res.status(403).send('Permission denied');
		});
};
