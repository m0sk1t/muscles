var app = require('express')(),
	morgan = require('morgan'),
	session = require('session'),
	passport = require('passport'),
	mongoose = require('mongoose'),
	http = require('http').Server(e),
	io = require('socket.io')(http),
	bodyParser = require('body-parser'),
	compression = require('compression'),
	serveStatic = require('serve-static'),
	serveFavicon = require('serve-favicon'),
	cookieParser = require('cookie-parser');

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

app.use(serveStatic(__dirname + '/static'));

//e.use(serveFavicon(__dirname + "/pub/img/favicon.ico"));

http.listen(4321, () => {
	require(__dirname + '/routes/router.js')(app, io);
	mongoose.connect('mongodb://localhost:27017/muscles');
	console.log('Server started at: ', new Date(), 'http://localhost:4321/');
});

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

module.exports = e;
