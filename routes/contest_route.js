module.exports = (app) => {
	var mongoose = require('mongoose'),
		Contests = mongoose.model('Contests', {
			title: String
		});
	app.route('/contest/:id')
		.get((req, res) => {
			if (req.params.id === 'all') {
				Contests.find({}, (err, contests) => {
					res.json(contests);
				});
			} else {
				Contests.findById(req.params.id, (err, contest) => {
					res.json(contest);
				});
			}
		})
		.put((req, res) => {
			delete req.body._id;
			delete req.body.__v;
			Contests.findByIdUpdate(req.params.id, {
				$set: req.body
			}, {
				upsert: false
			}, (err, contest) => {
				res.json(contest);
			});
		})
		.delete((req, res) => {
			Contests.findByIdAndRemove(req.params.id, (err, contest) => {
				res.json(contest);
			});
		});
};
