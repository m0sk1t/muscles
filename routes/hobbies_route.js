module.exports = (app) => {
	var Hobbie = require('../models/Hobbie');

	app.get('/hobbies', (req, res) => {
		Hobbie.find({}, (err, hobbies) => {
			if (err) return console.error(err);
			res.json(hobbies);
		});
	});
};
