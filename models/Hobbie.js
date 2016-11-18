var mongoose = require('mongoose'),
	HobbieSchema = mongoose.Schema({
		item: String,
		type: Boolean,
	});

module.exports = mongoose.model('Hobbies', HobbieSchema);
