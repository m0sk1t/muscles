module.exports = (app) => {
	var mongoose = require('mongoose'),
		Dialogs = mongoose.model('Dialogs', {
			users: Array,
			creDate: Date,
			deleters: Array,
			messages: Array,
		});
	app.route('/dialog/:id')
		.get((req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				Dialogs.find({
					users: user._id,
					deleters: {
						$ne: user._id
					}
				}, {
					users: 1,
					creDate: 1,
					messages: 1,
				}, (err, dialogs) => {
					res.json(dialogs);
				});
			});
		})
		.put((req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				Dialogs.findOneAndUpdate({
					users: user._id,
					_id: req.params.id,
				}, {
					$addToSet: {
						messages: req.body.message
					}
				}, (err, dialog) => {
					res.json(dialog);
				});
			});
		})
		.delete((req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				Dialogs.findOneAndUpdate({
					_id: req.params.id,
					users: user._id
				}, {
					$addToSet: {
						deleters: user._id
					}
				}, (err, dialog) => {
					res.json(dialog);
				});
			});
		});
	app.post('/dialog', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
			Dialogs.create({
				messages: [req.body.message],
				users: [user._id, req.body.addressee],
			}, (err, dialog) => {
				res.json(dialog);
			});
		});
	});
};
