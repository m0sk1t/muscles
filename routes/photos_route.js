module.exports = (app) => {
	var mongoose = require('mongoose'),
		multipart = require('connect-multiparty'),
		cloudinary = require('./cloudinary.js'),
		Photos = mongoose.model('Photos', {
			title: String,
			album: String,
			image: String,
			owner: String,
			creDate: Date,
			likes: Array,
			comments: Array,
		}),
		Albums = mongoose.model('Albums', {
			cover: {},
			creDate: Date,
			title: String,
			owner: String,
		}),
		Users = mongoose.model('Users');
	app.route('/photo/:id')
		.get((req, res) => {
			Photos.find({
				owner: req.params.id
			}, (err, photos) => {
				if (err) return console.error(err);
				res.json(photos);
			});
		})
		.put((req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				Photos.findOneAndUpdate({
					_id: req.params.id,
					owner: user._id
				}, {
					$set: {
						album: req.body.album,
						title: req.body.title
					}
				}, (err, photo) => {
					if (err) return console.error(err);
					res.json(photo);
				});
			});
		})
		.post(multipart({
			uploadDir: 'tmp'
		}), (req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				cloudinary.upload_image(req, (result) => {
					Photos.create({
						image: result,
						owner: user._id,
						creDate: Date.now(),
					}, (err, photo) => {
						if (err) return console.error(err);
						res.json(photo);
					});
				});
			});
		})
		.delete((req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				Photos.findOneAndRemove({
					_id: req.params.id,
					owner: user._id
				}, (err, photo) => {
					if (err) return console.error(err);
					if (photo) {
						cloudinary.delete_image(photo.image.split('/').pop().split('.')[0], (result) => {
							res.json(result);
						});
					} else {
						res.status(403).send('You arn\'t image owner!');
					}
				});
			});
		});
	app.get('/single_album/:id', (req, res) => {
		Albums.findById(req.params.id, (err, album) => {
			if (err) return console.error(err);
			res.json(album);
		});
	});
	app.route('/album/:id')
		.get((req, res) => {
			Albums.find({
				owner: req.params.id
			}, (err, albums) => {
				if (err) return console.error(err);
				res.json(albums);
			});
		})
		.put((req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				Albums.findOneAndUpdate({
					_id: req.params.id,
					owner: user._id
				}, {
					$set: {
						title: req.body.title
					}
				}, (err, album) => {
					if (err) return console.error(err);
					res.json(album);
				});
			});
		})
		.post((req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				Albums.create({
					owner: user._id,
					creDate: Date.now(),
					title: req.body.title,
				}, (err, album) => {
					if (err) return console.error(err);
					res.json(album);
				});
			});
		})
		.delete((req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				Albums.findOneAndRemove({
					_id: req.params.id,
					owner: user._id
				}, (err, album) => {
					if (err) return console.error(err);
					res.json(album);
				});
			});
		});

	app.put('/photo/:id/add_like', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
			if (!err && user) {
				Photos.findOneAndUpdate({
					_id: req.params.id
				}, {
					$addToSet: {
						likes: user._id
					}
				}, function(err, photo) {
					res.json(photo);
				});
			} else {
				res.status(500).send(err);
			}
		});
	});
	app.put('/photo/:id/remove_like', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
			if (!err && user) {
				Photos.findOneAndUpdate({
					_id: req.params.id
				}, {
					$pull: {
						likes: user._id
					}
				}, function(err, photo) {
					res.json(photo);
				});
			} else {
				res.status(500).send(err);
			}
		});
	});
	app.put('/photo/:id/add_comment', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
			if (!err && user) {
				Photos.findOneAndUpdate({
					_id: req.params.id
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
				}, function(err, photo) {
					res.json(photo);
				});
			} else {
				res.status(500).send(err);
			}
		});
	});
	app.put('/photo/:id/remove_comment', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
			if (!err && user) {
				Photos.findOneAndUpdate({
					_id: req.params.id
				}, {
					$pull: {
						comments: {
							userid: user._id,
							comment: req.body.comment,
						}
					}
				}, function(err, photo) {
					res.json(photo);
				});
			} else {
				res.status(500).send(err);
			}
		});
	});
};
