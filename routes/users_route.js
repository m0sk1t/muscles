module.exports = (app) => {
	var salt = require('./salt.js').salt,
		crypto = require('crypto'),
		mongoose = require('mongoose'),
		mailer = require('./mailer.js'),
		PIN = mongoose.model('PIN', {
			pin: Number,
			mail: String,
			userid: String,
			attempts: Number
		}),
		Users = mongoose.model('Users', {
			mail: String,
			ioid: String,
			name: String,
			surname: String,
			status: String,

			friends: Array,
			waiting: Array,
			subscribers: Array,

			creDate: Date,
			birthDate: Date,
			lastOnline: Date,

			online: Boolean,

			phone: String,
			userid: String,
			avatar: String,

			sex: String,
			type: String,
			hairs: String,
			weight: Number,
			height: Number,
			chest: Number, // грудь
			waist: Number, // талия
			huckle: Number, // бёдра

			location_city: String,
			location_country: String,

			settings: {
				comments_enabled: {
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

	app.post('/auth', (req, res) => {
		if (!req.body.mail || !req.body.pass) {
			res.status(500).send('Empty credentials!');
			return console.error('Empty credentials!');
		}
		var mail = req.body.mail.toLowerCase(),
			userid = crypto.createHash('sha256').update(mail + req.body.pass + salt).digest('hex'),
			pin = +crypto.createHash('md5').update(mail + salt + String(Date.now())).digest('hex').match(/\d+/g).join('').substr(0, 7),
			sendPin = function(cb) {
				PIN.findOneAndUpdate({
					mail: mail
				}, {
					$set: {
						pin: pin,
						mail: mail,
						attempts: 5,
						userid: userid,
					}
				}, {
					upsert: true
				}, function(e, newpin) {
					var mailOptions = {
						mail: [mail],
						subj: 'Данные для авторизации',
						html: 'Для авторизации в системе "Мускульного робота" вы можете ввести пин-код, написанный ниже:<p></p><p></p><span style="padding: 3px; border: 1px solid #ccc; color: #167aaf; font-size: 33px; font-weight: bold">' + pin + '</span>' +
							'<p></p>С уважением,<br>Команда "Мускульного робота"'
					};
					mailer.send_mail(mailOptions, function(error, info) {
						if (error) return console.log(error);
						console.log('Был послан: ' + info.response);
						cb();
					});
				});
			};
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
				sendPin(() => {
					res.send('OK!');
				});
			};
		});
	});

	app.get('/pin/:mail/:pin', function(req, res) {
		var mail = req.params.mail;
		PIN.findOne({
			mail: mail,
		}, function(e, pin) {
			if (e && !pin) return console.error(e);
			if (+pin.pin === +req.params.pin) {
				PIN.remove({
					mail: mail
				}, function(e, p) {
					Users.create({
						mail: mail,
						userid: pin.userid,
						creDate: Date.now(),
					}, (err, user) => {
						res.cookie('userid', pin.userid, {
							expires: new Date(Date.now() + 1000 * 60 * 60 * 24 * 365 * 10),
							httpOnly: true,
							path: '/'
						}).send('OK!');
					});
				});
			} else {
				if (pin.attempts > 0) {
					PIN.findOneAndUpdate({
						mail: mail
					}, {
						$inc: {
							attempts: -1
						}
					}, function(e, upin) {
						res.status(403).json({
							msg: 'Wrong pin!',
							attempts: pin.attempts
						});
					});
				} else {
					PIN.remove({
						mail: mail
					}, function(e, p) {
						res.status(500).send('Too many wrong attempts!');
					});
				}
			}
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
				birthDate: 1,
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

		(req.body.agefrom || req.body.ageto) && (search.birthDate = {});
		req.body.agefrom && (search.birthDate['$lt'] = new Date(Date.now() - (req.body.agefrom * 1000 * 60 * 60 * 24 * 365)));
		req.body.ageto && (search.birthDate['$gt'] = new Date(Date.now() - (req.body.ageto * 1000 * 60 * 60 * 24 * 365)));

		(req.body.sex && req.body.sex != 'n') && (search.sex = req.body.sex);

		(req.body.weightfrom || req.body.weightto) && (search.weight = {});
		req.body.weightfrom && (search.weight['$lte'] = req.body.weightto);
		req.body.weightto && (search.weight['$gte'] = req.body.weightfrom);

		(req.body.heightfrom || req.body.heightto) && (search.height = {});
		req.body.heightfrom && (search.height['$lte'] = req.body.heightto);
		req.body.heightto && (search.height['$gte'] = req.body.heightfrom);

		req.body.hairs && (search.hairs = req.body.hairs);
		req.body.type && (search.type = req.body.type);

		(req.body.chestfrom || req.body.chestto) && (search.chest = {});
		req.body.chestfrom && (search.chest['$lte'] = req.body.chestto);
		req.body.chestto && (search.chest['$gte'] = req.body.chestfrom);

		(req.body.waistfrom || req.body.waistto) && (search.waist = {});
		req.body.waistfrom && (search.waist['$lte'] = req.body.waistto);
		req.body.waistto && (search.waist['$gte'] = req.body.waistfrom);

		(req.body.hucklefrom || req.body.huckleto) && (search.huckle = {});
		req.body.hucklefrom && (search.huckle['$lte'] = req.body.huckleto);
		req.body.huckleto && (search.huckle['$gte'] = req.body.hucklefrom);

		req.body.location_city && (search.location_city = req.body.location_city);
		req.body.location_country && (search.location_country = req.body.location_country);

		console.log(search);

		Users.find(search, info, (err, users) => {
			if (!err) {
				res.json(users);
			} else {
				res.status(500).json(err);
			}
		});
	})
}
