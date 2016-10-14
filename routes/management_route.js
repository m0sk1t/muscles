module.exports = (app) => {
	var salt = 'N&*ud91)(R#@10(!)',
		crypto = require('crypto'),
		User = require('../models/User'),
		Video = require('../models/Video'),
		Photo = require('../models/Photo'),
		Topic = require('../models/Topic'),
		Hobbie = require('../models/Hobbie'),
		Manager = require('../models/Manager'),
		Article = require('../models/Article'),
		Contest = require('../models/Contest'),
		Competition = require('../models/Competition');

	var management_check = function(req, res, next) {
		if (!req.cookies.manager_uid) {
			res.status(403).send('You shall not pass!');
			return console.error('You shall not pass!');
		}
		Manager.findOne({ manager_uid: req.cookies.manager_uid }, (err, manager) => {
			if (err || !manager) return console.error(err || 'There is no manager');
			req.manager = manager;
			next();
		});
	};

	app.post('/manager/signin', (req, res) => {
		var manager_uid = crypto.createHash('sha256').update(req.body.login + salt + req.body.password).digest('hex');
		Manager.findOne({ manager_uid: manager_uid }, (err, manager) => {
			if (err || !manager) return console.error(err || 'Wrong credentials');
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
				$set: { permission: req.body }
			}, (err, manager) => {
				if (err) return console.error(err);
				res.json(manager);
			}) : res.status(403).send('Permission denied');
		}).post(management_check, (req, res) => {
			if (req.manager.permission.managers) {
				var manager = new Manager(),
					manager_uid = crypto.createHash('sha256').update(req.body.login + salt + req.body.password).digest('hex');
				manager.login = req.body.login;
				manager.manager_uid = manager_uid;
				manager.save((err) => {
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

	app.get('/manage/users', management_check, (req, res) => {
		User.find({}, (err, users) => {
			if (err) return console.error(err);
			res.json(users);
		});
	});
	app.delete('/manage/user/:id', management_check, (req, res) => {
		req.manager.permission.users ? User.findByIdAndRemove(req.params.id, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		}) : res.status(403).send('Permission denied');
	});
	app.get('/manage/photos', management_check, (req, res) => {
		Photo.find({}, (err, photos) => {
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
	app.get('/manage/videos', management_check, (req, res) => {
		Video.find({}, (err, videos) => {
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
	app.get('/manage/topics', management_check, (req, res) => {
		Topic.find({}, (err, topics) => {
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
	app.get('/manage/hobbies', management_check, (req, res) => {
		Hobbie.find({}, (err, hobbies) => {
			if (err) return console.error(err);
			res.json(hobbies);
		});
	});
	app.delete('/manage/hobbie/:id', management_check, (req, res) => {
		req.manager.permission.hobbies ? Hobbie.findByIdAndRemove(req.params.id, (err, hobbie) => {
			if (err) return console.error(err);
			res.json(hobbie);
		}) : res.status(403).send('Permission denied');
	});
	app.get('/manage/articles', management_check, (req, res) => {
		Article.find({}, (err, articles) => {
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
				$set: { title: req.body.title, text: req.body.text }
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
		}).delete(management_check, (req, res) => {
			req.manager.permission.articles ? Article.findByIdAndRemove(req.params.id, (err, article) => {
				if (err) return console.error(err);
				res.json(article);
			}) : res.status(403).send('Permission denied');
		});

	app.get('/manage/contests', management_check, (req, res) => {
		Contest.find({}, (err, contests) => {
			if (err) return console.error(err);
			res.json(contests);
		});
	});
	app.delete('/manage/contest/:id', management_check, (req, res) => {
		req.manager.permission.contests ? Contest.findByIdAndRemove(req.params.id, (err, contest) => {
			if (err) return console.error(err);
			res.json(contest);
		}) : res.status(403).send('Permission denied');
	});
	app.get('/manage/competitions', management_check, (req, res) => {
		Competition.find({}, (err, competitions) => {
			if (err) return console.error(err);
			res.json(competitions);
		});
	});
	app.delete('/manage/competition/:id', management_check, (req, res) => {
		req.manager.permission.competitions ? Competition.findByIdAndRemove(req.params.id, (err, competition) => {
			if (err) return console.error(err);
			res.json(competition);
		}) : res.status(403).send('Permission denied');
	});
};
