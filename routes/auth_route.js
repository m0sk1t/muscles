module.exports = (app) => {
	var express = require('express'),
		passport = require('passport'),
		session = require('express-session'),
		Users = require('mongoose').model('Users'),
		FacebookStrategy = require('passport-facebook').Strategy;

	app.disable('x-powered-by');

	app.use(session({
		resave: false,
		saveUninitialized: true,
		name: 'sportSessionID',
		secret: 'J(8uH*hFHIJShsidjisjvnau9h878t*^G^*g8g987G',
		cookie: {
			path: '/',
			secure: true,
			httpOnly: true,
			expires: Date.now() + 100 * 365 * 24 * 60 * 60 * 1000
		}
	}));

	app.use(passport.initialize());

	app.use(passport.session());

	passport.use(new FacebookStrategy({
			enableProof: true,
			clientID: '1782419512001549',
			clientSecret: '5b67b4ba8b40c064d0a10b714ba90232',
			callbackURL: "http://localhost:4321/auth/facebook/callback",
			profileFields: ['id', 'email', 'friends', 'first_name', 'last_name'],
		},
		(accessToken, refreshToken, profile, done) => {
			var user = profile._json;
			Users.findOneAndUpdate({
				'mail': user.email,
				'profile.fb.id': user.id,
			}, {
				'mail': user.email,
				'profile.fb': user,
				'name': user.first_name,
				'tokens.fb': accessToken,
				'surname': user.last_name,
				'social.fb_subscribers': user.friends.summary.total_count,
			}, {
				upsert: true
			}, (err, user) => {
				if (err) return done(err);
				done(null, user);
			});
		}
	));
	passport.serializeUser((user, done) => {
		done(null, user._id);
	});

	passport.deserializeUser((id, done) => {
		User.findById(id, (err, user) => {
			done(err, user);
		});
	});
	app.get('/auth/facebook',
		passport.authenticate('facebook', { scope: ['public_profile', 'email', 'publish_actions', 'user_friends'] })
	);
	app.get('/auth/facebook/callback',
		passport.authenticate('facebook', { failureRedirect: '/#/auth' }),
		(req, res) => {
			res.redirect('/#/options');
		});
};
