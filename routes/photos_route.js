module.exports = (app) => {
	var mongoose = require('mongoose'),
		multipart = require('connect-multiparty'),
		cloudinary = require('./cloudinary.js'),
		Photos = mongoose.model('Photos', {
			likes: Array,
			creDate: Date,
			title: String,
			image: String,
			owner: String,
			comments: Array,
		}),
		Albums = mongoose.model('Albums', {
			creDate: Date,
			title: String,
			cover: String,
			owner: String,
			photos: Array,
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
				if (req.body.owner === user._id) {
					Photos.findOneAndUpdate({
						_id: req.params.id,
						owner: user._id
					}, {
						$set: {
							title: req.body.title
						}
					}, (err, photo) => {
						if (err) return console.error(err);
						res.json(photo);
					});
				} else {
					res.status(403).send('You arn\'t image owner!');
				}
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
				console.log(req.cookies.userid);
				console.log(user._id);
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
				if (req.body.owner === user._id) {
					Albums.findOneAndUpdate({
						_id: req.params.id,
						owner: user._id
					}, {
						$set: req.body
					}, (err, album) => {
						if (err) return console.error(err);
						res.json(album);
					});
				} else {

				}
			});
		})
		.post((req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				Albums.create({
					title: req.body.title,
					owner: user._id
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
				console.log(user._id);
				if (req.body.owner === user._id) {
					Albums.findOneAndRemove({
						_id: req.params.id,
						owner: user
					}, (err, album) => {
						if (err) return console.error(err);
						res.json(album);
					});
				} else {
					res.status(403).send('You arn\'t image owner!');
				}
			});
		});
};
