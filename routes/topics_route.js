module.exports = (app) => {
	var mongoose = require('mongoose'),
		Topics = mongoose.model('Topics', {
			owner: String,
			text: String,
			creDate: Date,
			likes: Array,
			images: Array,
			videos: Array,
			comments: Array
		}),
		Users = mongoose.model('Users');
	app.route('/topic/:id')
		.get((req, res) => {
			Topics.find({
				owner: req.params.id
			}, (err, topics) => {
				if (err) return console.error(err);
				res.json(topics);
			});
		})
		.put((req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				Topics.findOneAndUpdate({
					_id: req.params.id,
					owner: user._id.toString()
				}, {
					text: req.body.text
				}, (err, topic) => {
					if (err) return console.error(err);
					res.json(topic);
				});
			});
		})
		.post((req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				Topics.create({
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
			});
		})
		.delete((req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				Topics.findOneAndRemove({
					_id: req.params.id,
					owner: user._id.toString()
				}, (err, topic) => {
					if (err) return console.error(err);
					res.json(topic);
				});
			});
		});

	app.put('/topic/:id/add_like', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
			if (!err && user) {
				Topics.findOneAndUpdate({
					_id: req.params.id
				}, {
					$addToSet: {
						likes: user._id.toString()
					}
				}, function(err, topic) {
					res.json(topic);
				});
			} else {
				res.status(500).send(err);
			}
		});
	});
	app.put('/topic/:id/remove_like', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
			if (!err && user) {
				Topics.findOneAndUpdate({
					_id: req.params.id
				}, {
					$pull: {
						likes: user._id.toString()
					}
				}, function(err, topic) {
					res.json(topic);
				});
			} else {
				res.status(500).send(err);
			}
		});
	});
	app.put('/topic/:id/add_comment', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
			if (!err && user) {
				Topics.findOneAndUpdate({
					_id: req.params.id
				}, {
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
		});
	});
	app.put('/topic/:id/remove_comment', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
			if (!err && user) {
				Topics.findOneAndUpdate({
					_id: req.params.id
				}, {
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
		});
	});
};
