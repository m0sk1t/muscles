var mongoose = require('mongoose'),
	DialogSchema = mongoose.Schema({
		users: Array,
		creDate: Date,
		messages: Array,
	});

module.exports = mongoose.model('Dialogs', DialogSchema);
