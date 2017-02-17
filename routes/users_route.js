module.exports = (app) => {
	var tools = require('./tools'),
		request = require('request'),
		User = require('../models/User');

	app.get('/user/:id', (req, res) => {
		User.findById(req.params.id, {
			pass: 0
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		});
	});

	app.get('/favs', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findById(req.user._id, (err, user) => {
			if (err) return console.error(err);
			User.find({
				_id: {
					$in: user.favs.map((el) => el.id)
				}
			}, {
				pass: 0
			}, (err, users) => {
				if (err) return console.error(err);
				res.json(users);
			});
		}) : res.status(403).send('Please, login first');
	});

	app.route('/user')
		.get(tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findById(req.user._id, (err, user) => {
				if (err) return console.error(err);
				res.json(user);
			}) : res.status(403).send('Please, login first');
		})
		.put(tools.ensureAuthenticated, (req, res) => {
			delete req.body._id;
			req.user ? User.findByIdAndUpdate(req.user._id, {
				$set: req.body
			}, {
				upsert: false
			}, (err, user) => {
				if (err) return console.error(err);
				res.json(user);
			}) : res.status(403).send('Please, login first');
		})
		.delete(tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findByIdAndRemove(req.user._id, (err, user) => {
				if (err) return console.error(err);
				res.clearCookie('userid').redirect('/');
			}) : res.status(403).send('Please, login first');
		});

	app.put('/unlink/:provider', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findById(req.user._id, (err, user) => {
			if (err) return console.error(err);
			user.social[req.params.provider] = undefined;
			user.tokens[req.params.provider] = undefined;
			user.save((err) => {
				res.json(user);
			});
		}) : res.status(403).send('Please, login first');
	})

	app.put('/user/add_mark/:id', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findByIdAndUpdate(req.params.id, {
			$addToSet: {
				marks: {
					userid: req.user._id,
					mark: req.body.mark
				}
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		}) : res.status(403).send('Please, login first');
	});

	app.put('/user/rm_mark/:id', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findByIdAndUpdate(req.params.id, {
			$pull: {
				marks: {
					userid: req.user._id
				}
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		}) : res.status(403).send('Please, login first');
	});

	app.put('/user/add_university', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findByIdAndUpdate(req.user._id, {
			$addToSet: {
				universities: req.body
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		}) : res.status(403).send('Please, login first');
	});

	app.put('/user/rm_university', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findByIdAndUpdate(req.user._id, {
			$pull: {
				universities: req.body
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		}) : res.status(403).send('Please, login first');
	});

	app.put('/user/add_workplace', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findByIdAndUpdate(req.user._id, {
			$addToSet: {
				workplaces: req.body
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		}) : res.status(403).send('Please, login first');
	});

	app.put('/user/rm_workplace', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findByIdAndUpdate(req.user._id, {
			$pull: {
				workplaces: req.body
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		}) : res.status(403).send('Please, login first');
	});

	app.put('/user/add_achievement', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findByIdAndUpdate(req.user._id, {
			$addToSet: {
				achievements: req.body
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		}) : res.status(403).send('Please, login first');
	});

	app.put('/user/rm_achievement', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findByIdAndUpdate(req.user._id, {
			$pull: {
				achievements: req.body
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		}) : res.status(403).send('Please, login first');
	});

	app.put('/user/add_hobbie', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findByIdAndUpdate(req.user._id, {
			$addToSet: {
				hobbies: req.body
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		}) : res.status(403).send('Please, login first');
	});

	app.put('/user/rm_hobbie', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findByIdAndUpdate(req.user._id, {
			$pull: {
				hobbies: req.body
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		}) : res.status(403).send('Please, login first');
	});

	app.put('/user/add_sport', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findByIdAndUpdate(req.user._id, {
			$addToSet: {
				sports: req.body.sport
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		}) : res.status(403).send('Please, login first');
	});

	app.put('/user/rm_sport', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findByIdAndUpdate(req.user._id, {
			$pull: {
				sports: req.body.sport
			}
		}, (err, user) => {
			if (err) return console.error(err);
			res.json(user);
		}) : res.status(403).send('Please, login first');
	});

	app.post('/user/search', (req, res) => {
		var search = {};
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

		req.body.location_city && (search['location_city.title'] = req.body.location_city.title);
		req.body.location_country && (search['location_country.title'] = req.body.location_country.title);

		console.log(search);

		User.find(search, {
			pass: 0,
		}, {
			limit: 50,
		}, (err, users) => {
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