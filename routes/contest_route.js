module.exports = (app) => {
	var Contest = require('../models/Contest');
	app.route('/contest/:id')
		.get((req, res) => {
			if (req.params.id === 'all') {
				Contest.find({}, (err, contests) => {
					res.json(contests);
				});
			} else {
				Contest.findById(req.params.id, (err, contest) => {
					res.json(contest);
				});
			}
		})
		.put((req, res) => {
			delete req.body._id;
			delete req.body.__v;
			Contest.findByIdUpdate(req.params.id, {
				$set: req.body
			}, {
				upsert: false
			}, (err, contest) => {
				res.json(contest);
			});
		})
		.delete((req, res) => {
			Contest.findByIdAndRemove(req.params.id, (err, contest) => {
				res.json(contest);
			});
		});
};
