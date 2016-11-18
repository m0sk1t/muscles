var mongoose = require('mongoose'),
	SportSchema = mongoose.Schema({
		sex: Boolean,
		sport: String,
	});

module.exports = mongoose.model('Sports', SportSchema);
