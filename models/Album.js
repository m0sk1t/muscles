var mongoose = require('mongoose'),
	AlbumSchema = mongoose.Schema({
		cover: {},
		creDate: Date,
		title: String,
		owner: String,
	});

module.exports = mongoose.model('Albums', AlbumSchema);