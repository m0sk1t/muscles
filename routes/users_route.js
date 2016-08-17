module.exports = (app) => {
	var salt = require('./salt.js').salt,
		crypto = require('crypto'),
		mongoose = require('mongoose'),
		mailer = require('./mailer.js'),
		Users = mongoose.model('Users', {
			mail: String,
			ioid: String,
			name: String,
			surname: String,
			status: String,

			creDate: Date,
			birthDate: Date,
			lastOnline: Date,

			online: Boolean,

			phone: String,
			userid: String,
			avatar: String,

			type: String,
			hairs: String,
			sex: Boolean,
			weight: Number,
			height: Number,
			chest: Number, // грудь
			waist: Number, // талия
			huckle: Number, // бёдра

			location_city: String,
			location_country: String,

			settings: {
				enable_comments: {
					type: Boolean,
					default: false
				},
				use_large_fonts: {
					type: Boolean,
					default: false
				},
				post_comments_enabled: {
					type: Boolean,
					default: false
				},
				show_notifications: {
					type: Boolean,
					default: false
				},
				show_notifications_text: {
					type: Boolean,
					default: false
				},
				notify_private: {
					type: Boolean,
					default: false
				},
				notify_comments: {
					type: Boolean,
					default: false
				},
				notify_photo_comments: {
					type: Boolean,
					default: false
				},
				notify_video_comments: {
					type: Boolean,
					default: false
				},
				notify_competitions: {
					type: Boolean,
					default: false
				},
				notify_contests: {
					type: Boolean,
					default: false
				},
				notify_birthdays: {
					type: Boolean,
					default: false
				},
			}
		});

	app.get('/test', (req, res) => {
		var started = Date.now();
		var c = 0;
		for (var i = 0; i < 1000000; i++) c++;
		res.send((Date.now() - started).toString());
	});

	app.get('/mail/:text', (req, res) => {
		mailer.send_mail({
			mail: ['m0sk1t@bk.ru'],
			subj: 'Testing email',
			text: req.params.text
		}, res);
	});

	app.post('/auth', (req, res) => {
		if (!req.body.mail || !req.body.pass) {
			res.status(500).send('Empty credentials!');
			return console.error('Empty credentials!');
		}
		var mail = req.body.mail.toLowerCase(),
			userid = crypto.createHash('sha256').update(mail + req.body.pass + salt).digest('hex');
		Users.findOne({
			mail: mail
		}, (err, user) => {
			if (err) return console.error(err);
			if (user) {
				if (user.userid === userid) {
					res.status(202).cookie("userid", userid, {
						expires: new Date(Date.now() + 1000 * 60 * 60 * 24 * 365 * 77),
						httpOnly: true,
						path: '/'
					}).json(user);
				} else {
					res.status(403).send('Wrong credentials!');
				}
			} else {
				Users.create({
					mail: mail,
					userid: userid,
					creDate: Date.now(),
				}, (err, user) => {
					res.cookie('userid', userid, {
						expires: new Date(Date.now() + 1000 * 60 * 60 * 24 * 365 * 10),
						httpOnly: true,
						path: '/'
					}).json(user);
				});
			};
		});
	});

	app.get('/user/:id', (req, res) => {
		Users.findById(req.params.id, {
			userid: 0
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		})
	})

	app.route('/user')
		.get((req, res) => {
			var userid = req.cookies.userid;
			if (userid) {
				Users.findOne({
					userid: userid
				}, (err, user) => {
					res.json(user);
				})
			} else {
				res.status(404).send('Need to register first!');
			}
		})
		.put((req, res) => {
			var userid = req.cookies.userid;
			delete req.body._id;
			delete req.body.__v;
			if (userid) {
				Users.findOneAndUpdate({
					userid: userid
				}, {
					$set: req.body
				}, {
					upsert: false
				}, (err, user) => {
					res.json(user);
				})
			} else {
				res.status(404).send('Need to register first!');
			}
		})
		.delete((req, res) => {
			if (userid) {
				Users.findOneAndRemove({
					userid: userid
				}, (err, user) => {
					res.clearCookie('userid').redirect('/');
				})
			} else {
				res.status(404).send('Need to register first!');
			}
		});

	app.post('/find_users', (req, res) => {
		var search = {},
			info = {
				mail: 1,
				name: 1,
				surname: 1,
				creDate: 1,
				phone: 1,
				age: 1,
				sex: 1,
				weight: 1,
				height: 1,
				hairs: 1,
				type: 1,
				chest: 1,
				waist: 1,
				huckle: 1,
				online: 1,
				lastOnline: 1,
				location_city: 1,
				location_country: 1
			};
		req.body.mail && (search.mail = req.body.mail);
		req.body.name && (search.name = req.body.name);
		req.body.surname && (search.surname = req.body.surname);
		req.body.creDate && (search.creDate = req.body.creDate);
		req.body.phone && (search.phone = req.body.phone);
		req.body.age && (search.age = req.body.age);
		req.body.sex && (search.sex = req.body.sex);
		req.body.weight && (search.weight = req.body.weight);
		req.body.height && (search.height = req.body.height);
		req.body.hairs && (search.hairs = req.body.hairs);
		req.body.type && (search.type = req.body.type);
		req.body.chest && (search.chest = req.body.chest);
		req.body.waist && (search.waist = req.body.waist);
		req.body.huckle && (search.huckle = req.body.huckle);
		req.body.location_city && (search.location_city = req.body.location_city);
		req.body.location_country && (search.location_country = req.body.location_country);
		Users.find(search, info, (err, users) => {
			if (!err) {
				res.json(users);
			} else {
				res.status(500).json(err);
			}
		});
	})
}
