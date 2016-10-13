var mongoose = require('mongoose'),
	ArticleSchema = mongoose.Schema({
		title: String
	});

module.exports = mongoose.model('Articles', ArticleSchema);
