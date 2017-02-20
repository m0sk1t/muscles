var mongoose = require('mongoose'),
	ArticleSchema = mongoose.Schema({
		comments: {
			type: Array,
			default: []
		},
		description: String,
		keywords: String,
		sport: String,
		creDate: Date,
		theme: String,
		title: String,
		owner: String,
		text: String,
	});

module.exports = mongoose.model('Articles', ArticleSchema);