module.exports = (app) => {
	var Sport = require('../models/Sport');

	app.get('/sports', (req, res) => {
		Sport.find({}, (err, sport) => {
			res.json(sport);
		});
	});
};
