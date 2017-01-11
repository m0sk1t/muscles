var mongoose = require('mongoose'),
	bcrypt = require('bcrypt'),
	SALT_WORK_FACTOR = 10,
	UserSchema = mongoose.Schema({
		name: {
			type: String,
			default: ''
		},
		ioid: {
			type: String,
			unique: true
		},
		status: {
			type: String,
			default: ''
		},
		surname: {
			type: String,
			default: ''
		},
		pass: {
			type: String
		},
		mail: {
			type: String,
			required: true,
			index: {
				unique: true
			}
		},

		social: {
			fb: {},
			vk: {},
			ok: {},
			tw: {},
			im: {},
		},

		tokens: {
			fb: String,
			vk: String,
			ok: String,
			tw: String,
			im: String,
		},

		friends: {
			type: Array,
			default: []
		},
		waiting: {
			type: Array,
			default: []
		},
		favs: {
			type: Array,
			default: []
		},
		marks: {
			type: Array,
			default: []
		},
		subscribers: {
			type: Array,
			default: []
		},

		sports: {
			type: Array,
			default: []
		},
		hobbies: {
			type: Array,
			default: []
		},
		workplaces: {
			type: Array,
			default: []
		},
		achievements: {
			type: Array,
			default: []
		},
		universities: {
			type: Array,
			default: []
		},

		birthDate: Date,
		creDate: {
			type: Date,
			default: new Date()
		},
		lastOnline: {
			type: Date,
			default: new Date()
		},

		online: Boolean,

		phone: {
			type: String,
			default: ''
		},
		avatar: {
			type: String,
			default: ''
		},

		likes: {
			free: Number,
			paid: Number,
		},

		sex: {
			type: String,
			default: ''
		},
		typage: {
			type: String,
			default: ''
		},
		hairs: {
			type: String,
			default: ''
		},

		weight: Number,
		height: Number,
		chest: Number, // грудь
		waist: Number, // талия
		huckle: Number, // бёдра

		location_city: {},
		location_country: {},

		settings: {
			comments_enabled: {
				type: Boolean,
				default: false
			},
			use_large_fonts: {
				type: Boolean,
				default: false
			},
			posting_enabled: {
				type: Boolean,
				default: false
			},
			show_notifications: {
				type: Boolean,
				default: false
			},
			show_notifications_text: {
				type: Boolean,
				default: false
			},
			notify_private: {
				type: Boolean,
				default: false
			},
			notify_topic_comments: {
				type: Boolean,
				default: false
			},
			notify_photo_comments: {
				type: Boolean,
				default: false
			},
			notify_video_comments: {
				type: Boolean,
				default: false
			},
			notify_competitions: {
				type: Boolean,
				default: false
			},
			notify_contests: {
				type: Boolean,
				default: false
			},
			notify_birthdays: {
				type: Boolean,
				default: false
			},
		}
	});

UserSchema.pre('save', function(next) {
	var user = this;

	// only hash the password if it has been modified (or is new)
	if (!user.isModified('pass')) return next();

	// generate a salt
	bcrypt.genSalt(SALT_WORK_FACTOR, (err, salt) => {
		if (err) return next(err);

		// hash the password using our new salt
		bcrypt.hash(user.pass, salt, (err, hash) => {
			if (err) return next(err);

			// override the cleartext password with the hashed one
			user.pass = hash;
			next();
		});
	});
});

UserSchema.methods.comparePassword = function(candidatePassword, cb) {
	bcrypt.compare(candidatePassword, this.pass, (err, isMatch) => {
		if (err) return cb(err);
		cb(null, isMatch);
	});
};

module.exports = mongoose.model('Users', UserSchema);
