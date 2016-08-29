module.exports = (app, io) => {
	require('./users_route.js')(app);
	require('./topics_route.js')(app);
	require('./status_route.js')(app);
	require('./photos_route.js')(app);
	require('./videos_route.js')(app);
	require('./article_route.js')(app);
	require('./contest_route.js')(app);
	require('./dialogs_route.js')(app);
	require('./hobbies_route.js')(app);
	require('./socket_route.js')(app, io);
	require('./competition_route.js')(app);
};
