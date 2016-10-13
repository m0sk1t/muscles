module.exports = (app) => {
	var multipart = require('connect-multiparty'),
		cloudinary = require('./cloudinary.js'),
		Album = require('../models/Album'),
		Photo = require('../models/Photo'),
		User = require('../models/User'),
		tools = require('./tools');

	app.route('/photo/:id')
		.get(tools.ensureAuthenticated, (req, res) => {
			Photo.find({
				owner: req.params.id
			}, (err, photos) => {
				if (err) return console.error(err);
				res.json(photos);
			});
		})
		.put(tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findById(req.user._id, (err, user) => {
				Photo.findOneAndUpdate({
					_id: req.params.id,
					owner: user._id.toString()
				}, {
					$set: {
						album: req.body.album,
						title: req.body.title,
					}
				}, (err, photo) => {
					if (err) return console.error(err);
					res.json(photo);
				});
			}) : res.status(403).send('Please, login first');
		})
		.post(multipart({
			uploadDir: 'tmp'
		}), tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findById(req.user._id, (err, user) => {
				cloudinary.upload_image(req, (result) => {
					Photo.create({
						image: result,
						owner: user._id.toString(),
						creDate: Date.now(),
					}, (err, photo) => {
						if (err) return console.error(err);
						res.json(photo);
					});
				});
			}) : res.status(403).send('Please, login first');
		})
		.delete(tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findById(req.user._id, (err, user) => {
				Photo.findOneAndRemove({
					_id: req.params.id,
					owner: user._id.toString()
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
			}) : res.status(403).send('Please, login first');
		});

	app.get('/single_album/:id', tools.ensureAuthenticated, (req, res) => {
		Album.findById(req.params.id, (err, album) => {
			if (err) return console.error(err);
			res.json(album);
		});
	});

	app.route('/album/:id')
		.get(tools.ensureAuthenticated, (req, res) => {
			Album.find({
				owner: req.params.id
			}, (err, albums) => {
				if (err) return console.error(err);
				res.json(albums);
			});
		})
		.put(tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findById(req.user._id, (err, user) => {
				Album.findOneAndUpdate({
					_id: req.params.id,
					owner: user._id.toString()
				}, {
					$set: {
						title: req.body.title
					}
				}, (err, album) => {
					if (err) return console.error(err);
					res.json(album);
				});
			}) : res.status(403).send('Please, login first');
		})
		.post(tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findById(req.user._id, (err, user) => {
				Album.create({
					owner: user._id.toString(),
					creDate: Date.now(),
					title: req.body.title,
				}, (err, album) => {
					if (err) return console.error(err);
					res.json(album);
				});
			}) : res.status(403).send('Please, login first');
		})
		.delete(tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findById(req.user._id, (err, user) => {
				Album.findOneAndRemove({
					_id: req.params.id,
					owner: user._id.toString()
				}, (err, album) => {
					if (err) return console.error(err);
					res.json(album);
				});
			}) : res.status(403).send('Please, login first');
		});

	app.put('/photo/:id/add_like', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findById(req.user._id, (err, user) => {
			if (!err && user) {
				Photo.findByIdAndUpdate(req.params.id, {
					$addToSet: {
						likes: user._id.toString()
					}
				}, function(err, photo) {
					res.json(photo);
				});
			} else {
				res.status(500).send(err);
			}
		}) : res.status(403).send('Please, login first');
	});

	app.put('/photo/:id/remove_like', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findById(req.user._id, (err, user) => {
			if (!err && user) {
				Photo.findByIdAndUpdate(req.params.id, {
					$pull: {
						likes: user._id.toString()
					}
				}, function(err, photo) {
					res.json(photo);
				});
			} else {
				res.status(500).send(err);
			}
		}) : res.status(403).send('Please, login first');
	});
	app.put('/photo/:id/add_comment', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findById(req.user._id, (err, user) => {
			if (!err && user) {
				Photo.findByIdAndUpdate(req.params.id, {
					$addToSet: {
						comments: {
							name: user.name,
							userid: user._id.toString(),
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
		}) : res.status(403).send('Please, login first');
	});
	app.put('/photo/:id/remove_comment', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findById(req.user._id, (err, user) => {
			if (!err && user) {
				Photo.findByIdAndUpdate(req.params.id, {
					$pull: {
						comments: {
							userid: user._id.toString(),
							comment: req.body.comment,
						}
					}
				}, function(err, photo) {
					res.json(photo);
				});
			} else {
				res.status(500).send(err);
			}
		}) : res.status(403).send('Please, login first');
	});
};
