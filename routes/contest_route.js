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
	app.get('/contest_participants/:id', tools.ensureAuthenticated, (req, res) => {
		req.user ? Contest.findById(req.params.id, (err, contest) => {
			if (err) return console.error(err);
			User.find({
				_id: { $in: contest.participants }
			}, {
				name: 1,
				avatar: 1,
			}, (err, participants) => {
				res.json(participants);
			})
		}) : res.status(403).send('Please, login first');
	});
	app.put('/contest/:id/add_participant', tools.ensureAuthenticated, (req, res) => {
		req.user ? Contest.findByIdAndUpdate(req.params.id, { $addToSet: { participants: req.user._id } }, (err, contest) => {
			if (err) return console.error(err);
			res.json(contest);
		}) : res.status(403).send('Please, login first');
	});
	app.put('/contest/:id/rm_participant', tools.ensureAuthenticated, (req, res) => {
		req.user ? Contest.findByIdAndUpdate(req.params.id, { $pull: { participants: req.user._id } }, (err, contest) => {
			if (err) return console.error(err);
			res.json(contest);
		}) : res.status(403).send('Please, login first');
	});
};
