module.exports = (app) => {
	var mongoose = require('mongoose'),
		Dialogs = mongoose.model('Dialogs', {
			title: String
		});
	app.route('/Dialog/:id')
		.get((req, res) => {
			if (req.params.id === 'all') {
				Dialogs.find({}, (err, dialogs) => {
					res.json(dialogs);
				});
			} else {
				Dialogs.findById(req.params.id, (err, dialog) => {
					res.json(dialog);
				});
			}
		})
		.put((req, res) => {
			delete req.body._id;
			delete req.body.__v;
			Dialogs.findByIdUpdate(req.params.id, {
				$set: req.body
			}, {
				upsert: false
			}, (err, dialog) => {
				res.json(dialog);
			});
		})
		.delete((req, res) => {
			Dialogs.findByIdAndRemove(req.params.id, (err, dialog) => {
				res.json(dialog);
			});
		});
};
