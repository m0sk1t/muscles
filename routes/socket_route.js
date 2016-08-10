module.exports = (app, io) => {
	var mongoose = require('mongoose'),
		Users = mongoose.model('Users');

	io.on('connection', (socket) => {
		var userid = (/userid=\w+/).exec(socket.client.request.headers.cookie) ? (/userid=\w+/).exec(socket.client.request.headers.cookie)[0].split('=')[1] : '';
		console.log('io:connection userid: ', userid);
		console.log('io:connection socket.id: ', socket.id);

		userid && Users.findOneAndUpdate({
			userid: userid
		}, {
			'$set': {
				'ioid': socket.id,
				'online': true
			}
		}, (err, user) => {
			if (err) return console.error(err);
			socket.emit('user:online', user.id);
		});

		socket.on('message:send', (data) => {
			io.emit('message:send', data);
		})

		socket.on('disconnect', () => {
			userid && Users.findOneAndUpdate({
				userid: userid
			}, {
				'$set': {
					'online': false,
					'lastOnline': Date.now()
				}
			}, (err, user) => {
				if (err) return console.error(err);
				socket.emit('user:disconnect');
			});
		});
	});
}
