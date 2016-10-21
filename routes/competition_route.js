module.exports = (app) => {
	var Competition = require('../models/Competition');
	app.get('/competition/:id', (req, res) => {
		if (req.params.id === 'all') {
			Competition.find({}, (err, competitions) => {
				res.json(competitions);
			});
		} else {
			Competition.findById(req.params.id, (err, competition) => {
				res.json(competition);
			});
		}
	});
};
