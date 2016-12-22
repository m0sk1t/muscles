var mongoose = require('mongoose'),
	ContestSchema = mongoose.Schema({
		type: String,
		owner: String,
		views: Number,
		title: String,
		creDate: Date,
		dateEnd: Date,
		prize: Number,
		dateStart: Date,
		description: String,
		participants: Array,
		dateParticipate: Date,
	});

module.exports = mongoose.model('Contests', ContestSchema);
