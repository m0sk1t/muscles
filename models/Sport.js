var mongoose = require('mongoose'),
	SportSchema = mongoose.Schema({
		type: boolean,
		text: String,
	});

module.exports = mongoose.model('Sports', SportSchema);
