module.exports = (app) => {
	var tools = require('./tools'),
		User = require('../models/User'),
		Video = require('../models/Video');

	app.route('/video/:id')
		.get(tools.ensureAuthenticated, (req, res) => {
			Video.find({
				owner: req.params.id
			}, (err, videos) => {
				if (err) return console.error(err);
				res.json(videos);
			});
		})
		.put(tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findById(req.user._id, (err, user) => {
				Video.findOneAndUpdate({
					_id: req.params.id,
					owner: user._id
				}, {
					$set: {
						title: req.body.title
					}
				}, (err, video) => {
					if (err) return console.error(err);
					res.json(video);
				});
			}) : res.status(403).send('Please, login first');
		})
		.post(tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findById(req.user._id, (err, user) => {
				Video.create({
					owner: user._id,
					creDate: Date.now(),
					link: req.body.link,
					type: req.body.type,
					title: req.body.title,
					thumbnail: req.body.thumbnail,
				}, (err, video) => {
					if (err) return console.error(err);
					res.json(video);
				});
			}) : res.status(403).send('Please, login first');
		})
		.delete(tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findById(req.user._id, (err, user) => {
				Video.findOneAndRemove({
					_id: req.params.id,
					owner: user._id,
				}, (err, video) => {
					if (err) return console.error(err);
					res.json(video);
				});
			}) : res.status(403).send('Please, login first');
		});

	app.put('/video/:id/add_like', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findById(req.user._id, (err, user) => {
			if (!err && user) {
				Video.findOneAndUpdate({
					_id: req.params.id,
				}, {
					$addToSet: {
						likes: user._id,
					}
				}, function(err, video) {
					res.json(video);
				});
			} else {
				res.status(500).send(err);
			}
		}) : res.status(403).send('Please, login first');
	});
	app.put('/video/:id/remove_like', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findById(req.user._id, (err, user) => {
			if (!err && user) {
				Video.findOneAndUpdate({
					_id: req.params.id,
				}, {
					$pull: {
						likes: user._id,
					}
				}, function(err, video) {
					res.json(video);
				});
			} else {
				res.status(500).send(err);
			}
		}) : res.status(403).send('Please, login first');
	});
	app.put('/video/:id/add_comment', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findById(req.user._id, (err, user) => {
			if (!err && user) {
				Video.findOneAndUpdate({
					_id: req.params.id,
				}, {
					$addToSet: {
						comments: {
							name: user.name,
							userid: user._id,
							date: Date.now(),
							avatar: user.avatar,
							surname: user.surname,
							comment: req.body.comment,
						}
					}
				}, function(err, video) {
					res.json(video);
				});
			} else {
				res.status(500).send(err);
			}
		}) : res.status(403).send('Please, login first');
	});
	app.put('/video/:id/remove_comment', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findById(req.user._id, (err, user) => {
			if (!err && user) {
				Video.findOneAndUpdate({
					_id: req.params.id,
				}, {
					$pull: {
						comments: {
							userid: user._id,
							comment: req.body.comment,
						}
					}
				}, function(err, video) {
					res.json(video);
				});
			} else {
				res.status(500).send(err);
			}
		}) : res.status(403).send('Please, login first');
	});
};
