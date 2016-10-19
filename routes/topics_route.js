module.exports = (app) => {
	var tools = require('./tools'),
		User = require('../models/User'),
		Topic = require('../models/Topic');

	app.route('/topic/:id')
		.get(tools.ensureAuthenticated, (req, res) => {
			Topic.find({
				owner: req.params.id
			}, (err, topics) => {
				if (err) return console.error(err);
				res.json(topics);
			});
		})
		.put(tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findById(req.user._id, (err, user) => {
				Topic.findOneAndUpdate({
					_id: req.params.id,
					owner: user._id.toString()
				}, {
					text: req.body.text
				}, (err, topic) => {
					if (err) return console.error(err);
					res.json(topic);
				});
			}) : res.status(403).send('Please, login first');
		})
		.post(tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findById(req.user._id, (err, user) => {
				Topic.create({
					likes: [],
					comments: [],
					creDate: Date.now(),
					text: req.body.text,
					images: req.body.images,
					owner: user._id.toString(),
				}, (err, topic) => {
					if (err) return console.error(err);
					res.json(topic);
				});
			}) : res.status(403).send('Please, login first');
		})
		.delete(tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findById(req.user._id, (err, user) => {
				Topic.findOneAndRemove({
					_id: req.params.id,
					owner: user._id.toString()
				}, (err, topic) => {
					if (err) return console.error(err);
					res.json(topic);
				});
			}) : res.status(403).send('Please, login first');
		});

	app.put('/topic/:id/add_like', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findById(req.user._id, (err, user) => {
			if (!err && user) {
				Topic.findByIdAndUpdate(req.params.id, {
					$addToSet: {
						likes: user._id.toString()
					}
				}, function(err, topic) {
					res.json(topic);
				});
			} else {
				res.status(500).send(err);
			}
		}) : res.status(403).send('Please, login first');
	});
	app.put('/topic/:id/remove_like', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findById(req.user._id, (err, user) => {
			if (!err && user) {
				Topic.findByIdAndUpdate(req.params.id, {
					$pull: {
						likes: user._id.toString()
					}
				}, function(err, topic) {
					res.json(topic);
				});
			} else {
				res.status(500).send(err);
			}
		}) : res.status(403).send('Please, login first');
	});
	app.put('/topic/:id/add_comment', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findById(req.user._id, (err, user) => {
			if (!err && user) {
				Topic.findByIdAndUpdate(req.params.id, {
					$addToSet: {
						comments: {
							name: user.name,
							date: Date.now(),
							avatar: user.avatar,
							surname: user.surname,
							comment: req.body.comment,
							userid: user._id.toString(),
						}
					}
				}, function(err, topic) {
					res.json(topic);
				});
			} else {
				res.status(500).send(err);
			}
		}) : res.status(403).send('Please, login first');
	});
	app.put('/topic/:id/remove_comment', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findById(req.user._id, (err, user) => {
			if (!err && user) {
				Topic.findByIdAndUpdate(req.params.id, {
					$pull: {
						comments: {
							userid: user._id.toString(),
							comment: req.body.comment,
						}
					}
				}, function(err, topic) {
					res.json(topic);
				});
			} else {
				res.status(500).send(err);
			}
		}) : res.status(403).send('Please, login first');
	});
};
