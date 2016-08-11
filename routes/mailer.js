module.exports = {
	send_mail: (options, res) => {
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
				from: '"Мускульный Робот 👥" <muscles.robot@gmail.com>',
				to: options.mail.join(','),
				subject: options.subj,
				text: options.text,
				html: options.html
			};
		transporter.sendMail(mailOptions, function(error, info) {
			if (error) {
				return console.log(error);
			}
			res.send('OK!');
			console.log('Message sent: ' + info.response);
		});
	}
}
