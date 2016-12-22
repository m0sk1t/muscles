module.exports = (app) => {
	var tools = require('./tools'),
		User = require('../models/User'),
		Contest = require('../models/Contest');
	app.get('/contest/:id', (req, res) => {
		if (req.params.id === 'all') {
			Contest.find({}, (err, contests) => {
				res.json(contests);
			});
		} else {
			Contest.findById(req.params.id, (err, contest) => {
				res.json(contest);
			});
		}
	});
	app.put('/contest/:id/add_participant', tools.ensureAuthenticated, (req, res) => {
		req.user ? Contest.findByIdAndUpdate(req.params.id, {
			$addToSet: {
				participants: {
					id: req.user._id,
					pDate: Date.now(),
					name: req.user.name,
					avatar: req.user.avatar,
					likes: {
						paid: [],
						free: [],
					},
				}
			}
		}, (err, contest) => {
			if (err) return console.error(err);
			res.json(contest);
		}) : res.status(403).send('Please, login first');
	});
	app.put('/contest/:id/rm_participant', tools.ensureAuthenticated, (req, res) => {
		req.user ? Contest.findByIdAndUpdate(req.params.id, {
			$pull: {
				participants: req.user._id
			}
		}, (err, contest) => {
			if (err) return console.error(err);
			res.json(contest);
		}) : res.status(403).send('Please, login first');
	});
	app.put('/contest/:id/add_paid_like/:pid', tools.ensureAuthenticated, (req, res) => {
		req.user && req.user.likes.paid ? Contest.findOneAndUpdate({
			'_id': req.params.id,
			'participants.id': req.params.pid
		}, {
			'$addToSet': {
				'participants.$.likes.paid': req.user._id
			}
		}, (err, contest) => {
			console.log(contest);
			if (err) return console.error(err);
			res.json(contest);
		}) : res.status(403).send('Action error!');
	});
	app.put('/contest/:id/add_free_like/:pid', tools.ensureAuthenticated, (req, res) => {
		req.user && req.user.likes.free ? Contest.findOneAndUpdate({
			'_id': req.params.id,
			'participants.id': req.params.pid
		}, {
			'$addToSet': {
				'participants.$.likes.free': req.user._id
			}
		}, (err, contest) => {
			console.log(contest);
			if (err) return console.error(err);
			res.json(contest);
		}) : res.status(403).send('Please, login first');
	});
};
