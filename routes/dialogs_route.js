module.exports = (app) => {
	var tools = require('./tools'),
		User = require('../models/User'),
		Dialog = require('../models/Dialog');

	app.route('/dialog/:id')
		.get(tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findById(req.user._id, (err, user) => {
				Dialog.find({
					'users.id': user._id.toString()
				}, (err, dialogs) => {
					res.json(dialogs);
				});
			}) : res.status(403).send('Please, login first');
		})
		.put(tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findById(req.user._id, (err, user) => {
				Dialog.findOneAndUpdate({
					'users.id': user._id.toString(),
					_id: req.params.id,
				}, {
					$addToSet: {
						messages: req.body.message,
						addressee: req.body.addressee
					}
				}, (err, dialog) => {
					res.json(dialog);
				});
			}) : res.status(403).send('Please, login first');
		})
		.delete(tools.ensureAuthenticated, (req, res) => {
			req.user ? User.findById(req.user._id, (err, user) => {
				Dialog.findOneAndUpdate({
					_id: req.params.id,
					'users.id': user._id.toString()
				}, {
					$pull: {
						users: {
							id: user._id.toString()
						}
					}
				}, (err, dialog) => {
					res.json(dialog);
				});
			}) : res.status(403).send('Please, login first');
		});

	app.get('/checkdlg/:id', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findById(req.user._id, (err, user) => {
			var search = {
				users: {
					$all: [{
						$elemMatch: {
							id: user._id.toString()
						}
					}, {
						$elemMatch: {
							id: req.params.id
						}
					}]
				}
			};
			Dialog.findOne(search, (err, dialog) => {
				console.log(dialog);
				if (dialog) {
					res.json(dialog);
				} else {
					res.status(404).send('Not found');
				}
			});
		}) : res.status(403).send('Please, login first');
	});

	app.post('/dialog', tools.ensureAuthenticated, (req, res) => {
		req.user ? User.findById(req.user._id, (err, user) => {
			var messages = [req.body.message];
			Dialog.create({
				messages: messages,
				users: [{
						id: user._id.toString(),
						avatar: user.avatar,
						fio: user.name + ' ' + user.surname,
					},
					req.body.addressee
				],
			}, (err, dialog) => {
				res.json(dialog);
			});
		}) : res.status(403).send('Please, login first');
	});
};
