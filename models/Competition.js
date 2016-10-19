var mongoose = require('mongoose'),
	CompetitionSchema = mongoose.Schema({
		date: Date,
		city: String,
		place: String,
		creDate: Date,
		owner: String,
		title: String,
		nomination: String,
		description: String,
	});

module.exports = mongoose.model('Competitions', CompetitionSchema);
