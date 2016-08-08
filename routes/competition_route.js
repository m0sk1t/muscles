module.exports = (app) => {
	var mongoose = require('mongoose'),
		Competitions = mongoose.model('Competitions', {
			title: String
		});
	app.route('/competition/:id')
		.get((req, res) => {
			if (req.params.id === 'all') {
				Competitions.find({}, (err, competitions) => {
					res.json(competitions);
				});
			} else {
				Competitions.findById(req.params.id, (err, competition) => {
					res.json(competition);
				});
			}
		})
		.put((req, res) => {
			delete req.body._id;
			delete req.body.__v;
			Competitions.findByIdUpdate(req.params.id, {
				$set: req.body
			}, {
				upsert: false
			}, (err, competition) => {
				res.json(competition);
			});
		})
		.delete((req, res) => {
			Competitions.findByIdAndRemove(req.params.id, (err, competition) => {
				res.json(competition);
			});
		});
};
