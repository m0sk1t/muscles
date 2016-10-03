module.exports = {
	send_mail: (options, cb) => {
		var nodemailer = require('nodemailer'),
			transporter = nodemailer.createTransport({
				host: 'smtp.gmail.com',
				port: 465,
				secure: true,
				auth: {
					user: 'muscles.robot@gmail.com',
					pass: 'q1w2e3r4@#$'
				}
			}),
			mailOptions = {
				from: '"Команда сети СпортПроект 👥" <muscles.robot@gmail.com>',
				to: options.mail.join(','),
				subject: options.subj,
				text: options.text,
				html: options.html
			};
		transporter.sendMail(mailOptions, (error, info) => {
			cb(error, info);
		});
	}
}
