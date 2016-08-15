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
			if (req.params.id === 'all') {
				Photos.find({}, (err, photos) => {
					if (err) return console.error(err);
					res.json(photos);
				});
			} else {
				Photos.findById(req.params.id, (err, photo) => {
					if (err) return console.error(err);
					res.json(photo);
				});
			}
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
	app.route('/album/:id')
		.get((req, res) => {
			if (req.params.id === 'all') {
				Albums.find({}, (err, albums) => {
					if (err) return console.error(err);
					res.json(albums);
				});
			} else {
				Albums.findById(req.params.id, (err, album) => {
					if (err) return console.error(err);
					res.json(album);
				});
			}
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

	app.put('/album/:id/add_photo/:photoid', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
			Albums.findOneAndUpdate({
				_id: req.params.id,
				owner: user._id
			}, {
				$addToSet: req.params.photoid
			}, (err, album) => {
				if (err) return console.error(err);
				res.json(album);
			});
		});
	});
	app.put('/album/:id/remove_photo/:photoid', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
			Albums.findOneAndUpdate({
				_id: req.params.id,
				owner: user._id
			}, {
				$pull: req.params.photoid
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
					_id: req.params.id,
					owner: user._id
				}, {
					$addToSet: {
						likes: user._id
					}
				})
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
					_id: req.params.id,
					owner: user._id
				}, {
					$pull: {
						likes: user._id
					}
				})
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
					_id: req.params.id,
					owner: user._id
				}, {
					$addToSet: {
						comments: {
							userid: user._id,
							date: Date.now(),
							avatar: user.avatar,
							comment: req.body.comment
						}
					}
				})
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
					_id: req.params.id,
					owner: user._id
				}, {
					$pull: {
						comments: {
							userid: user._id
						}
					}
				})
			} else {
				res.status(500).send(err);
			}
		});
	});
};
