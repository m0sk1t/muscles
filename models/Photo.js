var mongoose = require('mongoose'),
	PhotoSchema = mongoose.Schema({
		title: String,
		album: String,
		image: String,
		owner: String,
		creDate: Date,
		likes: Array,
		comments: Array,
	});

module.exports = mongoose.model('Photos', PhotoSchema);
