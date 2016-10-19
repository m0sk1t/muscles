var mongoose = require('mongoose'),
	ManagerSchema = mongoose.Schema({
		login: String,
		manager_uid: String,
		permission: {
			users: { type: Boolean, default: false },
			photos: { type: Boolean, default: false },
			videos: { type: Boolean, default: false },
			topics: { type: Boolean, default: false },
			articles: { type: Boolean, default: false },
			contests: { type: Boolean, default: false },
			hobbies: { type: Boolean, default: false },
			managers: { type: Boolean, default: false },
			competitions: { type: Boolean, default: false },
		}
	});

module.exports = mongoose.model('Managers', ManagerSchema);
