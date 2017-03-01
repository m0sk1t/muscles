module.exports = (app) => {
	var express = require('express'),
		mailer = require('./mailer'),
		passport = require('passport'),
		User = require('../models/User'),
		failRedirect = {
			failureRedirect: '/#/signup'
		},
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
						existingUser.social.fb = profile;
						existingUser.tokens.fb = accessToken;
						existingUser.mail = existingUser.mail || fb_user.email;
						existingUser.name = existingUser.name || fb_user.first_name;
						existingUser.surname = existingUser.surname || fb_user.last_name;
						existingUser.save((err) => {
							done(null, existingUser);
						});
					} else {
						User.findOne({
							mail: fb_user.email
						}, (err, existingUser) => {
							if (err) return done(err, false);
							if (existingUser) {
								existingUser.social.fb = profile;
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
								newUser.social.fb = profile;
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
				User.findOne({
					mail: fb_user.email
				}, (err, existingUser) => {
					if (err) return done(err, false);
					if (existingUser) {
						existingUser.social.fb = profile;
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
						newUser.social.fb = profile;
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
			var tw_mail = `${profile.username}@twitter.com`;
			if (req.user) {
				User.findById(req.user._id, (err, existingUser) => {
					if (err) return done(err, false);
					if (existingUser) {
						existingUser.social.tw = profile;
						existingUser.tokens.tw = accessToken;
						existingUser.mail = existingUser.mail || tw_mail;
						existingUser.name = existingUser.name || profile.displayName;
						existingUser.save((err) => {
							done(null, existingUser);
						});
					} else {
						User.findOne({
							mail: tw_mail
						}, (err, existingUser) => {
							if (err) return done(err, false);
							if (existingUser) {
								existingUser.social.tw = profile;
								existingUser.tokens.tw = accessToken;
								existingUser.mail = existingUser.mail || tw_mail;
								existingUser.name = existingUser.name || profile.displayName;
								existingUser.save((err) => {
									done(null, existingUser);
								});
							} else {
								const newUser = new User();
								newUser.mail = tw_mail;
								newUser.social.tw = profile;
								newUser.tokens.tw = accessToken;
								newUser.name = profile.displayName;
								newUser.save((err) => {
									done(err, newUser);
								});
							}
						});
					}
				});
			} else {
				User.findOne({
					mail: tw_mail
				}, (err, existingUser) => {
					if (err) return done(err, false);
					if (existingUser) {
						existingUser.social.tw = profile;
						existingUser.tokens.tw = accessToken;
						existingUser.mail = existingUser.mail || tw_mail;
						existingUser.name = existingUser.name || profile.displayName;
						existingUser.save((err) => {
							done(null, existingUser);
						});
					} else {
						const newUser = new User();
						newUser.mail = tw_mail;
						newUser.social.tw = profile;
						newUser.tokens.tw = accessToken;
						newUser.name = profile.displayName;
						newUser.save((err) => {
							done(err, newUser);
						});
					}
				});
			}
		}
	));

	passport.use(new InstagramStrategy({
			passReqToCallback: true,
			callbackURL: '/auth/im/callback',
			clientID: 'a8670feee3604961ab948ed2c97097a2',
			clientSecret: 'a399672808064e179ee76d807229256d',
		},
		(req, accessToken, refreshToken, profile, done) => {
			var im_mail = `${profile.username}@instagram.com`;
			if (req.user) {
				User.findById(req.user._id, (err, existingUser) => {
					if (err) return done(err, false);
					if (existingUser) {
						existingUser.social.im = profile;
						existingUser.tokens.im = accessToken;
						existingUser.mail = existingUser.mail || im_mail;
						existingUser.name = existingUser.name || profile.displayName;
						existingUser.save((err) => {
							done(null, existingUser);
						});
					} else {
						User.findOne({
							mail: im_mail
						}, (err, existingUser) => {
							if (err) return done(err, false);
							if (existingUser) {
								existingUser.social.im = profile;
								existingUser.tokens.im = accessToken;
								existingUser.mail = existingUser.mail || im_mail;
								existingUser.name = existingUser.name || profile.displayName;
								existingUser.save((err) => {
									done(null, existingUser);
								});
							} else {
								const newUser = new User();
								newUser.mail = im_mail;
								newUser.social.im = profile;
								newUser.tokens.im = accessToken;
								newUser.name = profile.displayName;
								newUser.save((err) => {
									done(err, newUser);
								});
							}
						});
					}
				});
			} else {
				User.findOne({
					mail: im_mail
				}, (err, existingUser) => {
					if (err) return done(err, false);
					if (existingUser) {
						existingUser.social.im = profile;
						existingUser.tokens.im = accessToken;
						existingUser.mail = existingUser.mail || im_mail;
						existingUser.name = existingUser.name || profile.displayName;
						existingUser.save((err) => {
							done(null, existingUser);
						});
					} else {
						const newUser = new User();
						newUser.mail = im_mail;
						newUser.social.im = profile;
						newUser.tokens.im = accessToken;
						newUser.name = profile.displayName;
						newUser.save((err) => {
							done(err, newUser);
						});
					}
				});
			}
		}
	));

	passport.use(new VKStrategy({
			apiVersion: '5.50',
			clientID: '5644041 ',
			passReqToCallback: true,
			scope: ['email', 'friends'],
			callbackURL: '/auth/vk/callback',
			clientSecret: '8ZaUaUiSD385gvoR7Kbo',
			profileFields: ['email', 'first_name', 'last_name', 'friends']
		},
		(req, accessToken, refreshToken, params, profile, done) => {
			var vk_user = profile._json;
			if (req.user) {
				User.findById(req.user._id, (err, existingUser) => {
					if (err) return done(err, false);
					if (existingUser) {
						existingUser.social.vk.profile = profile;
						existingUser.social.vk.params = params;
						existingUser.tokens.vk = accessToken;
						existingUser.mail = existingUser.mail || params.email;
						existingUser.name = existingUser.name || vk_user.first_name;
						existingUser.surname = existingUser.surname || vk_user.last_name;
						existingUser.save((err) => {
							done(null, existingUser);
						});
					} else {
						User.findOne({
							mail: params.email
						}, (err, existingUser) => {
							if (err) return done(err, false);
							if (existingUser) {
								existingUser.social.vk.profile = profile;
								existingUser.social.vk.params = params;
								existingUser.tokens.vk = accessToken;
								existingUser.mail = existingUser.mail || params.email;
								existingUser.name = existingUser.name || vk_user.first_name;
								existingUser.surname = existingUser.surname || vk_user.last_name;
								existingUser.save((err) => {
									done(null, existingUser);
								});
							} else {
								const newUser = new User();
								newUser.mail = params.email;
								newUser.social.vk.profile = profile;
								newUser.social.vk.params = params;
								newUser.tokens.vk = accessToken;
								newUser.name = vk_user.first_name;
								newUser.surname = vk_user.last_name;
								newUser.save((err) => {
									done(err, newUser);
								});
							}
						});
					}
				});
			} else {
				User.findOne({
					mail: params.email
				}, (err, existingUser) => {
					if (err) return done(err, false);
					if (existingUser) {
						existingUser.social.vk.profile = profile;
						existingUser.social.vk.params = params;
						existingUser.tokens.vk = accessToken;
						existingUser.mail = existingUser.mail || params.email;
						existingUser.name = existingUser.name || vk_user.first_name;
						existingUser.surname = existingUser.surname || vk_user.last_name;
						existingUser.save((err) => {
							done(null, existingUser);
						});
					} else {
						const newUser = new User();
						newUser.mail = params.email;
						newUser.social.vk.profile = profile;
						newUser.social.vk.params = params;
						newUser.tokens.vk = accessToken;
						newUser.name = vk_user.first_name;
						newUser.surname = vk_user.last_name;
						newUser.save((err) => {
							done(err, newUser);
						});
					}
				});
			}
		}
	));

	passport.use(new OKStrategy({
			passReqToCallback: true,
			callbackURL: '/auth/ok/callback',
			clientID: '1249885952',
			clientPublic: 'CBAQLQHLEBABABABA',
			clientSecret: ' AF5F33BC3ACFFFA2627152D3',
			access_token: 'tkn1AnYQQsiq9n7W9kwvhn935f1xbGGI77UATWGaNV4qEbpfxauQZmqobWsacd4gRyGb0',
		},
		(req, accessToken, refreshToken, profile, done) => {
			var ok_user = profile._json;
			if (req.user) {
				User.findById(req.user._id, (err, existingUser) => {
					if (err) return done(err, false);
					if (existingUser) {
						existingUser.social.ok = profile;
						existingUser.tokens.ok = accessToken;
						existingUser.mail = existingUser.mail || profile.email;
						existingUser.name = existingUser.name || ok_user.first_name;
						existingUser.surname = existingUser.surname || ok_user.last_name;
						existingUser.save((err) => {
							done(null, existingUser);
						});
					} else {
						User.findOne({
							mail: profile.email
						}, (err, existingUser) => {
							if (err) return done(err, false);
							if (existingUser) {
								existingUser.social.ok = profile;
								existingUser.tokens.ok = accessToken;
								existingUser.mail = existingUser.mail || profile.email;
								existingUser.name = existingUser.name || ok_user.first_name;
								existingUser.surname = existingUser.surname || ok_user.last_name;
								existingUser.save((err) => {
									done(null, existingUser);
								});
							} else {
								const newUser = new User();
								newUser.mail = profile.email;
								newUser.social.ok = profile;
								newUser.tokens.ok = accessToken;
								newUser.name = ok_user.first_name;
								newUser.surname = ok_user.last_name;
								newUser.save((err) => {
									done(err, newUser);
								});
							}
						});
					}
				});
			} else {
				User.findOne({
					mail: profile.email
				}, (err, existingUser) => {
					if (err) return done(err, false);
					if (existingUser) {
						existingUser.social.ok = profile;
						existingUser.tokens.ok = accessToken;
						existingUser.mail = existingUser.mail || profile.email;
						existingUser.name = existingUser.name || ok_user.first_name;
						existingUser.surname = existingUser.surname || ok_user.last_name;
						existingUser.save((err) => {
							done(null, existingUser);
						});
					} else {
						const newUser = new User();
						newUser.mail = profile.email;
						newUser.social.ok = profile;
						newUser.tokens.ok = accessToken;
						newUser.name = ok_user.first_name;
						newUser.surname = ok_user.last_name;
						newUser.save((err) => {
							done(err, newUser);
						});
					}
				});
			}
		}
	));

	app.post('/signup', (req, res, next) => {
		req.assert('mail', 'Ваш адрес почты некорректен!').isEmail();
		req.sanitize('mail').normalizeEmail({
			remove_dots: false
		});
		req.assert('pass', 'Для вашей же безопасности пароль должен быть длиной не меньше 7 символов!').len(7);

		const errors = req.validationErrors();

		if (errors) {
			console.error(errors);
			return res.status(500).json(errors);
		}

		const user = new User({
			pass: req.body.pass,
			ioid: Date.now().toString(),
			mail: req.body.mail.toLowerCase(),
		});

		User.findOne({
			mail: req.body.mail
		}, (err, existingUser) => {
			if (err) return next(err);
			if (existingUser) return res.status(500).json([{
				msg: 'Указанный адрес почты уже зарегистрирован, попробуйте войти со своим паролем!'
			}]);
			user.save((err) => {
				if (err) return next(err);
				mailer.send_mail({
					mail: [req.body.mail.toLowerCase()],
					subj: 'Регистрация в сети СпортПроект',
					text: 'Поздравляем! Вы успешно зарегистрировались в сети СпортПроект. Ваш логин ' + req.body.mail.toLowerCase() + '!',
				}, (err, info) => {
					console.error(err);
					console.log(info);
					if (err) return res.status(500).json([{
						msg: err
					}]);
					req.logIn(user, (err) => {
						if (err) return next(err);
						delete user.pass;
						res.json(user);
					});
				});
			});
		});
	});

	app.put('/changepwd', (req, res, next) => {
		req.assert('password', 'Для вашей же безопасности пароль должен быть длиной не меньше 7 символов!').len(7);
		req.assert('confirmPassword', 'Пароли не совпадают').equals(req.body.password);

		const errors = req.validationErrors();

		if (errors) {
			return res.status(500).json(errors);
		}

		User.findById(req.user.id, (err, user) => {
			if (err) return next(err);
			user.password = req.body.password;
			user.save((err) => {
				if (err) return next(err);
				res.json({
					msg: 'Пароль успешно изменён!'
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
		passport.authenticate('facebook', failRedirect),
		(req, res) => {
			res.redirect('/#/options/profile');
		}
	);

	app.get('/auth/tw',
		passport.authenticate('twitter')
	);

	app.get('/auth/tw/callback',
		passport.authenticate('twitter', failRedirect),
		(req, res) => {
			res.redirect('/#/options/profile');
		}
	);

	app.get('/auth/im',
		passport.authenticate('instagram')
	);

	app.get('/auth/im/callback',
		passport.authenticate('instagram', failRedirect),
		(req, res) => {
			res.redirect('/#/options/profile');
		}
	);

	app.get('/auth/vk',
		passport.authenticate('vkontakte', {
			scope: ['friends']
		})
	);

	app.get('/auth/vk/callback',
		passport.authenticate('vkontakte', failRedirect),
		(req, res) => {
			res.redirect('/#/options/profile');
		}
	);

	app.get('/auth/ok',
		passport.authenticate('odnoklassniki', {
			scope: ['friends']
		})
	);

	app.get('/auth/ok/callback',
		passport.authenticate('odnoklassniki', failRedirect),
		(req, res) => {
			res.redirect('/#/options/profile');
		}
	);

	app.get('/logout', (req, res) => {
		req.logout();
		res.redirect('/');
	});
};