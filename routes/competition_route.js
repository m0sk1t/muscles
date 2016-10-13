module.exports = (app) => {
	var Competition = require('../models/Competition');
	app.route('/competition/:id')
		.get((req, res) => {
			if (req.params.id === 'all') {
				Competition.find({}, (err, competitions) => {
					res.json(competitions);
				});
			} else {
				Competition.findById(req.params.id, (err, competition) => {
					res.json(competition);
				});
			}
		})
		.put((req, res) => {
			delete req.body._id;
			delete req.body.__v;
			Competition.findByIdUpdate(req.params.id, {
				$set: req.body
			}, {
				upsert: false
			}, (err, competition) => {
				res.json(competition);
			});
		})
		.delete((req, res) => {
			Competition.findByIdAndRemove(req.params.id, (err, competition) => {
				res.json(competition);
			});
		});
};
