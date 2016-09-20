module.exports = (app) => {
	var mongoose = require('mongoose'),
		Videos = mongoose.model('Videos', {
			link: String,
			type: String,
			title: String,
			owner: String,
			creDate: Date,
			likes: Array,
			comments: Array,
			thumbnail: String,
		}),
		Users = mongoose.model('Users');
	app.route('/video/:id')
		.get((req, res) => {
			Videos.find({
				owner: req.params.id
			}, (err, videos) => {
				if (err) return console.error(err);
				res.json(videos);
			});
		})
		.put((req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				Videos.findOneAndUpdate({
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
			});
		})
		.post((req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				Videos.create({
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
			});
		})
		.delete((req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				Videos.findOneAndRemove({
					_id: req.params.id,
					owner: user._id,
				}, (err, video) => {
					if (err) return console.error(err);
					res.json(video);
				});
			});
		});

	app.put('/video/:id/add_like', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
			if (!err && user) {
				Videos.findOneAndUpdate({
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
		});
	});
	app.put('/video/:id/remove_like', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
			if (!err && user) {
				Videos.findOneAndUpdate({
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
		});
	});
	app.put('/video/:id/add_comment', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
			if (!err && user) {
				Videos.findOneAndUpdate({
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
		});
	});
	app.put('/video/:id/remove_comment', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
			if (!err && user) {
				Videos.findOneAndUpdate({
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
		});
	});
};
