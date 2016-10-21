module.exports = (app) => {
	var Contest = require('../models/Contest');
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
};
