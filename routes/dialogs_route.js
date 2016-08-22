module.exports = (app) => {
	var mongoose = require('mongoose'),
		Dialogs = mongoose.model('Dialogs', {
			creDate: Date,
			users: Array,
			messages: Array,
		});
	app.route('/dialog/:id')
		.get((req, res) => {
			if (req.params.id === 'all') {
				Users.findOne({
					userid: req.cookies.userid
				}, (err, user) => {
					Dialogs.find({
						users: user._id,
					}, {
						users: 1,
						creDate: 1,
					}, (err, dialogs) => {
						res.json(dialogs);
					});
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
