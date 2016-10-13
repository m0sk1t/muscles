var mongoose = require('mongoose'),
	ContestSchema = mongoose.Schema({
		title: String
	});

module.exports = mongoose.model('Contests', ContestSchema);
