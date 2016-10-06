module.exports = (app) => {
	var crypto = require('crypto'),
		request = require('request'),
		mongoose = require('mongoose'),
		User = require('../models/User');

	app.get('/user/:id', (req, res) => {
		User.findById(req.params.id, {
			pass: 0
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		});
	});

	app.route('/user')
		.get((req, res) => {
			User.findById(req.user.id, (err, user) => {
				res.json(user);
			});
		})
		.put((req, res) => {
			var userid = req.cookies.userid;
			delete req.body._id;
			delete req.body.__v;
			if (userid) {
				User.findOneAndUpdate({
					userid: userid
				}, {
					$set: req.body
				}, {
					upsert: false
				}, (err, user) => {
					res.json(user);
				});
			} else {
				res.status(404).send('Need to register first!');
			}
		})
		.delete((req, res) => {
			if (userid) {
				User.findOneAndRemove({
					userid: userid
				}, (err, user) => {
					res.clearCookie('userid').redirect('/');
				});
			} else {
				res.status(404).send('Need to register first!');
			}
		});

	app.put('/user/add_university', (req, res) => {
		User.findOneAndUpdate({
			userid: req.cookies.userid
		}, {
			$addToSet: {
				universities: req.body
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		});
	});

	app.put('/user/rm_university', (req, res) => {
		User.findOneAndUpdate({
			userid: req.cookies.userid
		}, {
			$pull: {
				universities: req.body
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		});
	});

	app.put('/user/add_workplace', (req, res) => {
		User.findOneAndUpdate({
			userid: req.cookies.userid
		}, {
			$addToSet: {
				workplaces: req.body
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		});
	});

	app.put('/user/rm_workplace', (req, res) => {
		User.findOneAndUpdate({
			userid: req.cookies.userid
		}, {
			$pull: {
				workplaces: req.body
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		});
	});

	app.put('/user/add_achievement', (req, res) => {
		User.findOneAndUpdate({
			userid: req.cookies.userid
		}, {
			$addToSet: {
				achievements: req.body
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		});
	});

	app.put('/user/rm_achievement', (req, res) => {
		User.findOneAndUpdate({
			userid: req.cookies.userid
		}, {
			$pull: {
				achievements: req.body
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		});
	});

	app.post('/user/search', (req, res) => {
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

		User.find(search, info, (err, users) => {
			if (!err) {
				res.json(users);
			} else {
				res.status(500).json(err);
			}
		});
	});

	app.post('/vk/:method', (req, res) => {
		console.log('req.body', req.body);
		request.post({
			url: 'https://api.vk.com/method/' + req.params.method,
			formData: req.body
		}, (err, response) => {
			if (err) return console.error(err);
			console.log('response.body', response.body);
			res.json(JSON.parse(response.body).response);
		});
	});
}
