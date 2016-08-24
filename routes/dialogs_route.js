module.exports = (app) => {
	var mongoose = require('mongoose'),
		Users = mongoose.model('Users'),
		Dialogs = mongoose.model('Dialogs', {
			users: Array,
			creDate: Date,
			messages: Array,
		});
	app.route('/dialog/:id')
		.get((req, res) => {
			Users.findOne({
				userid: req.cookies.userid
			}, (err, user) => {
				Dialogs.find({
					'users.id': user._id.toString()
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
					'users.id': user._id.toString(),
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
					'users.id': user._id.toString()
				}, {
					$pull: {
						'users.id': user._id
					}
				}, (err, dialog) => {
					res.json(dialog);
				});
			});
		});
	app.get('/checkdlg/:id', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
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
			Dialogs.findOne(search, (err, dialog) => {
				console.log(dialog);
				if (dialog) {
					res.json(dialog);
				} else {
					res.status(404).send('Not found');
				}
			});
		});
	});
	app.post('/dialog', (req, res) => {
		Users.findOne({
			userid: req.cookies.userid
		}, (err, user) => {
			var messages = [req.body.message];
			Dialogs.create({
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
		});
	});
};
