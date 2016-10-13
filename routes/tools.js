module.exports = {
	ensureAuthenticated: function(req, res, next) {
		var isAuth = req.isAuthenticated();
		if (isAuth) return next();
		res.redirect('/');
	}
};
