module.exports = (app) => {
	var salt = require('./salt.js').salt,
		crypto = require('crypto'),
		mongoose = require('mongoose'),
		Schema = mongoose.Schema,
		Users = mongoose.model('Users', {
			mail: String,
			name: String,
			phone: String,
			userid: String,
			avatar: String,

			age: Date,
			sex: Boolean,
			weight: Number,
			height: Number,
			hairs: String,
			type: String,

			chest: Number,
			waist: Number,
			huckle: Number,

			location_city: String,
			location_country: String,

			auto_play_gifs: Boolean,
			use_large_fonts: Boolean,
			post_comments_enabled: Boolean,
		});

	app.get('/test', (req, res) => {
		res.send('OK!');
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
					res.json(user);
				})
			} else {
				res.status(404).send('Need to register first!');
			}
		});
}
