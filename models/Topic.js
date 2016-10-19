var mongoose = require('mongoose'),
	TopicSchema = mongoose.Schema({
		owner: String,
		text: String,
		creDate: Date,
		likes: Array,
		images: Array,
		videos: Array,
		comments: Array
	});

module.exports = mongoose.model('Topics', TopicSchema);
