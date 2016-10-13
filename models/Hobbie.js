var mongoose = require('mongoose'),
	HobbieSchema = mongoose.Schema({
		title: String
	});

module.exports = mongoose.model('Hobbies', HobbieSchema);
