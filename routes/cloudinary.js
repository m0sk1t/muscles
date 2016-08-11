module.exports = {
	upload_image: (req, cb) => {
		var cloudinary = require('cloudinary'),
			path = __dirname + '/../' + req.files.file.path,
			cloudinary.config(require('../cloudinary_config.js'));
		cloudinary.uploader.upload(path, (result) => {
			fs.unlink(path, () => {
				cb(result.secure_url);
			});
		});
	},
	delete_image: (file, cb) => {
		var cloudinary = require('cloudinary'),
			cloudinary.config(require('../cloudinary_config.js'));
		cloudinary.uploader.destroy(file, (result) => cb(result));
	}
}
