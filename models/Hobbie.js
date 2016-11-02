var mongoose = require('mongoose'),
	HobbieSchema = mongoose.Schema({
		items: Array,
		title: String,
	});

module.exports = mongoose.model('Hobbies', HobbieSchema);
