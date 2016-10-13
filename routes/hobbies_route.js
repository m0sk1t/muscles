module.exports = (app) => {
	var Hobbie = require('../models/Hobbie');

	app.route('/hobbie/:id')
		.get((req, res) => {
			if (req.params.id === all) {
				Hobbie.find({}, (err, hobbies) => {
					if (err) return console.error(err);
					res.json(hobbies);
				});
			} else {
				Hobbie.findById(req.params.id, (err, hobbie) => {
					if (err) return console.error(err);
					res.json(hobbie);
				});
			}
		})
		.put((req, res) => {
			if ( /* check for admin */ 0) {
				Hobbie.findByIdAndUpdate(req.params.id, {
					name: req.body.name
				}, (err, hobbie) => {
					if (err) return console.error(err);
					res.json(hobbie);
				});
			}
		})
		.post((req, res) => {
			if ( /* check for admin */ 0) {
				Hobbie.create({
					name: req.body.name
				}, (err, hobbie) => {
					if (err) return console.error(err);
					res.json(hobbie);
				});
			}
		})
		.delete((req, res) => {
			if ( /* check for admin */ 0) {
				Hobbie.findByIdAndRemove(req.params.id, (err, hobbie) => {
					if (err) return console.error(err);
					res.json(hobbie);
				});
			}
		});
};
