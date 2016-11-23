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
		freeVoices: Number,
		paidVoices: Number,
		description: String,
		participants: Array,
	});

module.exports = mongoose.model('Contests', ContestSchema);
