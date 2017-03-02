var mongoose = require('mongoose'),
	AlbumSchema = mongoose.Schema({
		cover: String,
		creDate: Date,
		title: String,
		owner: String,
	});

module.exports = mongoose.model('Albums', AlbumSchema);