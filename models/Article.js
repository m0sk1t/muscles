var mongoose = require('mongoose'),
	ArticleSchema = mongoose.Schema({
		creDate: Date,
		// TODO: desription
		desription: String,
		// TODO: thumbnail upload
		thumbnail: String,
		title: String,
		owner: String,
		text: String,
	});

module.exports = mongoose.model('Articles', ArticleSchema);
