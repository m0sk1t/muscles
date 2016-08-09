module.exports = (app, io) => {
	var mongoose = require('mongoose'),
		Users = mongoose.model('Users');
	io.on('connection', function(socket) {
		var userid = (/userid=\w+/).exec(socket.client.request.headers.cookie) ? (/userid=\w+/).exec(socket.client.request.headers.cookie)[0].split('=')[1] : '';
		console.log('io:connection userid: ', userid);
		console.log('io:connection socket.id: ', socket.id);
		socket.emit('user:online');

		userid && Users.findOneAndUpdate({
			userid: userid
		}, {
			'$set': {
				'ioid': socket.id,
				'online': true
			}
		}, function(err, user) {
			if (err) return console.error(err);
		});

		socket.on('disconnect', function() {
			userid && Users.findOneAndUpdate({
				userid: userid
			}, {
				'$set': {
					'online': false,
					'lastOnline': Date.now()
				}
			}, function(err, user) {
				if (err) return console.error(err);
				socket.emit('user:disconnect');
			});
		});
	});
}
