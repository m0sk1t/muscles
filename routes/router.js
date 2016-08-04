module.exports = (app) => {
	require('./users_route.js')(app);
	require('./hobbies_route.js')(app);
};
