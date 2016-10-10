module.exports = (app, io) => {
	var mongoose = require('mongoose'),
		mailer = require('./mailer.js'),
		Users = mongoose.model('Users');

	io.on('connection', (socket) => {
		console.log('io:connection socket.id: ', socket.id);
		var id = '';

		socket.on('user:online', (data) => {
			id = data.id;
			id && Users.findByIdAndUpdate(id, {
				'$set': {
					'ioid': socket.id,
					'online': true
				}
			}, (err, user) => {
				console.log('user:online - ', id);
				if (err) return console.error(err);
				user && socket.emit('user:online', user.id);
			});
		});

		socket.on('new:message', (data) => {
			Users.findById(data.target, (err, user) => {
				user.settings.notify_private && mailer.send_mail({
					mail: [user.mail],
					subj: 'У вас новое сообщение!',
					text: data.fio + ' сказал:' + data.message,
				}, (error, info) => {
					socket.broadcast.to(user.ioid).emit('new:message', data);
				});
			});
		});

		socket.on('topic:comment', (data) => {
			Users.findById(data.target, (err, user) => {
				user.settings.post_comments_enabled && mailer.send_mail({
					mail: [user.mail],
					subj: 'Новый комментарий к вашей записи!',
					text: data.name + ' ' + data.surname + ' сказал:' + data.comment,
				}, (error, info) => {
					socket.broadcast.to(user.ioid).emit('topic:comment', data);
				});
			});
		});

		socket.on('photo:comment', (data) => {
			Users.findById(data.target, (err, user) => {
				user.settings.notify_photo_comments && mailer.send_mail({
					mail: [user.mail],
					subj: 'Новый комментарий к вашему фото!',
					text: data.name + ' ' + data.surname + ' сказал:' + data.comment,
				}, (error, info) => {
					socket.broadcast.to(user.ioid).emit('photo:comment', data);
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
			id && Users.findByIdAndUpdate(id, {
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
};
