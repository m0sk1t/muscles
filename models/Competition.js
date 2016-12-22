var mongoose = require('mongoose'),
	CompetitionSchema = mongoose.Schema({
		end: Date,
		start: Date,
		city: String,
		place: String,
		creDate: Date,
		owner: String,
		title: String,
		// TODO: thumbnail upload
		thumbnail: String,
		// TODO: category upload
		category: String,
		nomination: String,
		description: String,
	});

module.exports = mongoose.model('Competitions', CompetitionSchema);
