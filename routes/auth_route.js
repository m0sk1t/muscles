module.exports = (app) => {
	var express = require('express'),
		passport = require('passport'),
		User = require('../models/User'),
		LocalStrategy = require('passport-local').Strategy,
		VKStrategy = require('passport-vkontakte').Strategy,
		TwitterStrategy = require('passport-twitter').Strategy,
		OKStrategy = require('passport-odnoklassniki').Strategy,
		FacebookStrategy = require('passport-facebook').Strategy,
		InstagramStrategy = require('passport-instagram').Strategy;

	passport.use(new LocalStrategy({
		usernameField: 'mail',
		passwordField: 'pass'
	}, (mail, pass, done) => {
		User.findOne({
			mail: mail.toLowerCase()
		}, (err, user) => {
			if (err) {
				return done(err);
			}
			if (!user) {
				return done(null, false, {
					msg: `Email ${mail} not found.`
				});
			}
			user.comparePassword(pass, (err, isMatch) => {
				if (err) {
					return done(err);
				}
				if (isMatch) {
					return done(null, user);
				}
				return done(null, false, {
					msg: 'Invalid mail or password.'
				});
			});
		});
	}));

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
				'profile.fb.id': user.id,
				'mail': user.email.toLowerCase(),
			}, {
				'profile.fb': user,
				'name': user.first_name,
				'tokens.fb': accessToken,
				'surname': user.last_name,
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

	app.post('/signup', (req, res, next) => {
		req.assert('mail', 'Email is not valid').isEmail();
		req.sanitize('mail').normalizeEmail({
			remove_dots: false
		});
		req.assert('pass', 'Password must be at least 4 characters long').len(4);

		const errors = req.validationErrors();

		if (errors) {
			req.flash('errors', errors);
			return res.redirect('/#/signup');
		}

		const user = new User({
			pass: req.body.pass,
			mail: req.body.mail.toLowerCase(),
		});

		User.findOne({
			mail: req.body.mail
		}, (err, existingUser) => {
			if (err) {
				return next(err);
			}
			if (existingUser) {
				return res.redirect('/#/signin');
			}
			user.save((err) => {
				if (err) {
					return next(err);
				}
				req.logIn(user, (err) => {
					if (err) {
						return next(err);
					}
					res.json(user);
				});
			});
		});
	});

	app.post('/auth/local', passport.authenticate('local'));

	app.get('/auth/facebook',
		passport.authenticate('facebook', {
			scope: ['public_profile', 'email', 'publish_actions', 'user_friends']
		})
	);

	app.get('/auth/facebook/callback',
		passport.authenticate('facebook', {
			failureRedirect: '/#/auth'
		}),
		(req, res) => {
			res.redirect('/#/options');
		}
	);

	app.get('/auth/twitter',
		passport.authenticate('twitter')
	);

	app.get('/auth/twitter/callback',
		passport.authenticate('twitter', {
			failureRedirect: '/login'
		}),
		(req, res) => {
			res.redirect('/#/options');
		}
	);

	app.get('/auth/instagram',
		passport.authenticate('instagram')
	);

	app.get('/auth/instagram/callback',
		passport.authenticate('instagram', {
			failureRedirect: '/login'
		}),
		(req, res) => {
			res.redirect('/#/options');
		}
	);

	app.get('/auth/twitter',
		passport.authenticate('twitter')
	);

	app.get('/auth/twitter/callback',
		passport.authenticate('twitter', {
			failureRedirect: '/login'
		}),
		(req, res) => {
			res.redirect('/#/options');
		}
	);
};
