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

	passport.serializeUser((user, done) => {
		done(null, user.id);
	});

	passport.deserializeUser((id, done) => {
		User.findById(id, (err, user) => {
			done(err, user);
		});
	});

	passport.use(new LocalStrategy({
		usernameField: 'mail',
		passwordField: 'pass'
	}, (mail, pass, done) => {
		User.findOne({
			mail: mail.toLowerCase()
		}, (err, user) => {
			if (err) return done(err);
			if (!user) return done(null, false, {
				msg: `Email ${mail} not found.`
			});

			user.comparePassword(pass, (err, isMatch) => {
				if (err) return done(err);
				if (isMatch) {
					delete user.pass;
					return done(null, user);
				}
				return done(null, false, {
					msg: 'Invalid mail or password.'
				});
			});
		});
	}));

	passport.use(new FacebookStrategy({
			passReqToCallback: true,
			clientID: '1782419512001549',
			callbackURL: "/auth/fb/callback",
			clientSecret: '5b67b4ba8b40c064d0a10b714ba90232',
			profileFields: ['id', 'email', 'friends', 'first_name', 'last_name'],
		},
		(req, accessToken, refreshToken, profile, done) => {
			var fb_user = profile._json;
			if (req.user) {
				User.findById(req.user._id, (err, existingUser) => {
					if (err) return done(err, false);
					if (existingUser) {
						existingUser.social.fb = fb_user;
						existingUser.tokens.fb = accessToken;
						existingUser.mail = existingUser.mail || fb_user.email;
						existingUser.name = existingUser.name || fb_user.first_name;
						existingUser.surname = existingUser.surname || fb_user.last_name;
						existingUser.save((err) => {
							done(null, existingUser);
						});
					} else {
						User.findOne({ mail: fb_user.email }, (err, existingUser) => {
							if (err) return done(err, false);
							if (existingUser) {
								existingUser.social.fb = fb_user;
								existingUser.tokens.fb = accessToken;
								existingUser.mail = existingUser.mail || fb_user.email;
								existingUser.name = existingUser.name || fb_user.first_name;
								existingUser.surname = existingUser.surname || fb_user.last_name;
								existingUser.save((err) => {
									done(null, existingUser);
								});
							} else {
								const newUser = new User();
								newUser.mail = fb_user.email;
								newUser.social.fb = fb_user;
								newUser.tokens.fb = accessToken;
								newUser.name = fb_user.first_name;
								newUser.surname = fb_user.last_name;
								newUser.save((err) => {
									done(err, newUser);
								});
							}
						});
					}
				});
			} else {
				User.findOne({ mail: fb_user.email }, (err, existingUser) => {
					if (err) return done(err, false);
					if (existingUser) {
						existingUser.social.fb = fb_user;
						existingUser.tokens.fb = accessToken;
						existingUser.mail = existingUser.mail || fb_user.email;
						existingUser.name = existingUser.name || fb_user.first_name;
						existingUser.surname = existingUser.surname || fb_user.last_name;
						existingUser.save((err) => {
							done(null, existingUser);
						});
					} else {
						const newUser = new User();
						newUser.mail = fb_user.email;
						newUser.social.fb = fb_user;
						newUser.tokens.fb = accessToken;
						newUser.name = fb_user.first_name;
						newUser.surname = fb_user.last_name;
						newUser.save((err) => {
							done(err, newUser);
						});
					}
				});
			}
		}
	));

	passport.use(new TwitterStrategy({
			passReqToCallback: true,
			callbackURL: '/auth/tw/callback',
			consumerKey: 'C3nDiK9uZyQUYSGKy9b8rolvM',
			consumerSecret: '4Bq5CYp2VfQZYHWmc4ryXjOuEAiGk549GzyXDtLmjCdGZtDx7A',
		},
		(req, accessToken, refreshToken, profile, done) => {
			var tw_user = profile,
				tw_mail = `${profile.username}@twitter.com`;
			if (req.user) {
				User.findById(req.user._id, (err, existingUser) => {
					if (err) return done(err, false);
					if (existingUser) {
						existingUser.social.tw = tw_user;
						existingUser.tokens.tw = accessToken;
						existingUser.mail = existingUser.mail || tw_mail;
						existingUser.name = existingUser.name || tw_user.displayName;
						existingUser.save((err) => {
							done(null, existingUser);
						});
					} else {
						User.findOne({ mail: tw_mail }, (err, existingUser) => {
							if (err) return done(err, false);
							if (existingUser) {
								existingUser.social.tw = tw_user;
								existingUser.tokens.tw = accessToken;
								existingUser.mail = existingUser.mail || tw_mail;
								existingUser.name = existingUser.name || tw_user.displayName;
								existingUser.save((err) => {
									done(null, existingUser);
								});
							} else {
								const newUser = new User();
								newUser.mail = tw_mail;
								newUser.social.tw = tw_user;
								newUser.tokens.tw = accessToken;
								newUser.name = tw_user.displayName;
								newUser.save((err) => {
									done(err, newUser);
								});
							}
						});
					}
				});
			} else {
				User.findOne({ mail: tw_mail }, (err, existingUser) => {
					if (err) return done(err, false);
					if (existingUser) {
						existingUser.social.tw = tw_user;
						existingUser.tokens.tw = accessToken;
						existingUser.mail = existingUser.mail || tw_mail;
						existingUser.name = existingUser.name || tw_user.displayName;
						existingUser.save((err) => {
							done(null, existingUser);
						});
					} else {
						const newUser = new User();
						newUser.mail = tw_mail;
						newUser.social.tw = tw_user;
						newUser.tokens.tw = accessToken;
						newUser.name = tw_user.displayName;
						newUser.save((err) => {
							done(err, newUser);
						});
					}
				});
			}
		}
	));

	app.post('/signup', (req, res, next) => {
		req.assert('mail', 'Email is not valid').isEmail();
		req.sanitize('mail').normalizeEmail({
			remove_dots: false
		});
		req.assert('pass', 'Password must be at least 4 characters long').len(4);

		const errors = req.validationErrors();

		if (errors) {
			console.error(errors);
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
				res.redirect('/#/signin');
				return;
			}
			user.save((err) => {
				if (err) {
					return next(err);
				}
				req.logIn(user, (err) => {
					if (err) {
						return next(err);
					}
					delete user.pass;
					res.json(user);
				});
			});
		});
	});

	app.post('/auth/local',
		passport.authenticate('local'),
		(req, res) => {
			res.json(req.user);
		});

	app.get('/auth/fb',
		passport.authenticate('facebook', {
			scope: ['public_profile', 'email', 'publish_actions', 'user_friends']
		})
	);

	app.get('/auth/fb/callback',
		passport.authenticate('facebook', {
			failureRedirect: '/#/signup'
		}),
		(req, res) => {
			res.redirect('/#/options');
		}
	);

	app.get('/auth/tw',
		passport.authenticate('twitter')
	);

	app.get('/auth/tw/callback',
		passport.authenticate('twitter', {
			failureRedirect: '/#/signup'
		}),
		(req, res) => {
			res.redirect('/#/options');
		}
	);

	app.get('/auth/im',
		passport.authenticate('instagram')
	);

	app.get('/auth/im/callback',
		passport.authenticate('instagram', {
			failureRedirect: '/#/signup'
		}),
		(req, res) => {
			res.redirect('/#/options');
		}
	);

	app.get('/auth/vk',
		passport.authenticate('vkontakte')
	);

	app.get('/auth/vk/callback',
		passport.authenticate('vkontakte', {
			failureRedirect: '/#/signup'
		}),
		(req, res) => {
			res.redirect('/#/options');
		}
	);

	app.get('/auth/ok',
		passport.authenticate('odnoklassniki')
	);

	app.get('/auth/ok/callback',
		passport.authenticate('odnoklassniki', {
			failureRedirect: '/#/signup'
		}),
		(req, res) => {
			res.redirect('/#/options');
		}
	);

	app.get('/logout', function(req, res) {
		req.logout();
		res.redirect('/');
	});
};
