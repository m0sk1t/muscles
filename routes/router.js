module.exports = (app) => {
	require('./users_route.js')(app);
	require('./status_route.js')(app);
	require('./article_route.js')(app);
	require('./contest_route.js')(app);
	require('./dialogs_route.js')(app);
	require('./hobbies_route.js')(app);
	require('./competition_route.js')(app);
};
