var e = require('express')(),
	morgan = require('morgan'),
	mongoose = require('mongoose'),
	http = require('http').Server(e),
	io = require('socket.io')(http),
	bodyParser = require('body-parser'),
	compression = require('compression'),
	serveStatic = require('serve-static'),
	serveFavicon = require('serve-favicon'),
	cookieParser = require('cookie-parser');

e.use(morgan('combined'));

e.use(compression());

e.use(cookieParser());

e.use(bodyParser.urlencoded({
	limit: '3mb',
	extended: true
}));

e.use(bodyParser.json({
	limit: '3mb'
}));

e.use(serveStatic(__dirname + '/static'));

//e.use(serveFavicon(__dirname + "/pub/img/favicon.ico"));

http.listen(4321, () => {
	require(__dirname + '/routes/router.js')(e, io);
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
