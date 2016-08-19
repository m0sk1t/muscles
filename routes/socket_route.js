module.exports = (app, io) => {
	var mongoose = require('mongoose'),
		mailer = require('./mailer.js'),
		Users = mongoose.model('Users');

	io.on('connection', (socket) => {
		console.log('io:connection socket.id: ', socket.id);

		function set_io_id() {
			var userid = (/userid=\w+/).exec(socket.client.request.headers.cookie) ? (/userid=\w+/).exec(socket.client.request.headers.cookie)[0].split('=')[1] : '';
			console.log('io:connection userid: ', userid);
			userid && Users.findOneAndUpdate({
				userid: userid
			}, {
				'$set': {
					'ioid': socket.id,
					'online': true
				}
			}, (err, user) => {
				if (err) return console.error(err);
				user && socket.emit('user:online', user.id);
			});

		}

		set_io_id();

		socket.on('user:created', (data) => {
			set_io_id();
		});

		socket.on('photo:comment', (data) => {
			Users.findById(data.target, (err, user) => {
				user.settings.notify_photo_comments && mailer.send_mail({
					mail: [user.mail],
					subj: 'Новый комментарий к вашему фото!',
					text: data.name + ' ' + data.surname + ' сказал:' + data.comment,
				}, (error, info) => {
					user.settings.show_notifications && socket.broadcast.to(user.ioid).emit('photo:comment', data);
				});
			});
		});

		socket.on('video:comment', (data) => {
			Users.findById(data.target, (err, user) => {
				user.settings.notify_video_comments && mailer.send_mail({
					mail: [user.mail],
					subj: 'Новый комментарий к вашему видео!',
					text: data.name + ' ' + data.surname + ' сказал:' + data.comment,
				}, (error, info) => {
					socket.broadcast.to(user.ioid).emit('video:comment', data);
				});
			});
		});

		socket.on('disconnect', () => {
			var userid = (/userid=\w+/).exec(socket.client.request.headers.cookie) ? (/userid=\w+/).exec(socket.client.request.headers.cookie)[0].split('=')[1] : '';
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
