module.exports = (app) => {
	var mongoose = require('mongoose'),
		Hobbies = mongoose.model('Hobbies', {
			name: String
		});
	app.route('/hobbie/:id')
		.get((req, res) => {
			if (req.params.id === all) {
				Hobbies.find({}, (err, hobbies) => {
					if (err) return console.error(err);
					res.json(hobbies);
				});
			} else {
				Hobbies.findById(req.params.id, (err, hobbie) => {
					if (err) return console.error(err);
					res.json(hobbie);
				});
			}
		})
		.put((req, res) => {
			if ( /* check for admin */ 0) {
				Hobbies.findByIdAndUpdate(req.params.id, {
					name: req.body.name
				}, (err, hobbie) => {
					if (err) return console.error(err);
					res.json(hobbie);
				});
			}
		})
		.post((req, res) => {
			if ( /* check for admin */ 0) {
				Hobbies.create({
					name: req.body.name
				}, (err, hobbie) => {
					if (err) return console.error(err);
					res.json(hobbie);
				});
			}
		})
		.delete((req, res) => {
			if ( /* check for admin */ 0) {
				Hobbies.findByIdAndRemove(req.params.id, (err, hobbie) => {
					if (err) return console.error(err);
					res.json(hobbie);
				});
			}
		});
};
