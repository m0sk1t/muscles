var mongoose = require('mongoose'),
	CompetitionSchema = mongoose.Schema({
		title: String
	});

module.exports = mongoose.model('Competitions', CompetitionSchema);
