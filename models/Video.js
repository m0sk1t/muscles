var mongoose = require('mongoose'),
	VideoSchema = mongoose.Schema({
		link: String,
		type: String,
		title: String,
		owner: String,
		creDate: Date,
		likes: Array,
		comments: Array,
		thumbnail: String,
	});

module.exports = mongoose.model('Videos', VideoSchema);
