var app = require('express')(),
	chalk = require('chalk'),
	morgan = require('morgan'),
	passport = require('passport'),
	mongoose = require('mongoose'),
	http = require('http').Server(app),
	io = require('socket.io')(http),
	bodyParser = require('body-parser'),
	compression = require('compression'),
	session = require('express-session'),
	serveStatic = require('serve-static'),
	errorHandler = require('errorhandler'),
	serveFavicon = require('serve-favicon'),
	cookieParser = require('cookie-parser'),
	MongoStore = require('connect-mongo')(session),
	expressValidator = require('express-validator');

app.disable('x-powered-by');

app.use(morgan('combined'));

app.use(compression());

app.use(cookieParser());

app.use(bodyParser.urlencoded({
	limit: '3mb',
	extended: true
}));

app.use(bodyParser.json({
	limit: '3mb'
}));

app.use(expressValidator());

app.use(session({
	resave: true,
	saveUninitialized: true,
	name: 'sportSessionID',
	secret: 'J(8uH*hFHIJShsidjisjvnau9h878t*^G^*g8g987G',
	store: new MongoStore({
		autoReconnect: true,
		url: 'mongodb://localhost:27017/muscles',
	}),
	cookie: {
		path: '/',
		secure: true,
		httpOnly: true,
		expires: Date.now() + 100 * 365 * 24 * 60 * 60 * 1000
	}
}));

app.use(passport.initialize());

app.use(passport.session());

app.use(serveStatic(__dirname + '/static'));

//e.use(serveFavicon(__dirname + "/pub/img/favicon.ico"));

http.listen(4321, () => {
	mongoose.Promise = global.Promise;
	require(__dirname + '/routes/router.js')(app, io);
	mongoose.connect('mongodb://localhost:27017/muscles');
	console.log('%s Server started at: %s, path: %s', chalk.green('✓'), new Date(), 'http://localhost:4321/');
	mongoose.connection.on('connected', () => {
		console.log('%s MongoDB connection established!', chalk.green('✓'));
	});
	mongoose.connection.on('error', () => {
		console.log('%s MongoDB connection error. Please make sure MongoDB is running.', chalk.red('✗'));
		process.exit();
	});
});

app.use(errorHandler());
/*
process.stdin.resume();

function exitHandler(options, err) {
	if (err) console.log(err.stack);
	if (options.exit) {
		mongoose.connection.close();
		process.exit();
	}
}

process.on('exit', exitHandler.bind(null, {
	exit: true
}));

process.on('SIGINT', exitHandler.bind(null, {
	exit: true
}));

process.on('uncaughtException', exitHandler.bind(null, {
	exit: false
}));
*/
module.exports = app;
