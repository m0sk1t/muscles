module.exports = (app) => {
	var mongoose = require('mongoose'),
		Photos = mongoose.model('Photos', {
			name: String,
			image: String,
			owner: String,
			comments: Array,
		}),
		Albums = mongoose.model('Albums', {
			name: String,
			cover: String,
			owner: String,
			photos: Array,
		});
	app.route('/photo/:id')
		.get((req, res) => {
			if (req.params.id === all) {
				Photos.find({}, (err, photos) => {
					if (err) return console.error(err);
					res.json(photos);
				});
			} else {
				Photos.findById(req.params.id, (err, photo) => {
					if (err) return console.error(err);
					res.json(photo);
				});
			}
		})
		.put((req, res) => {
			if ( /* check for admin */ 0) {
				Photos.findByIdAndUpdate(req.params.id, {
					name: req.body.name
				}, (err, photo) => {
					if (err) return console.error(err);
					res.json(photo);
				});
			}
		})
		.post((req, res) => {
			if ( /* check for admin */ 0) {
				Photos.create({
					name: req.body.name
				}, (err, photo) => {
					if (err) return console.error(err);
					res.json(photo);
				});
			}
		})
		.delete((req, res) => {
			if ( /* check for admin */ 0) {
				Photos.findByIdAndRemove(req.params.id, (err, photo) => {
					if (err) return console.error(err);
					res.json(photo);
				});
			}
		});
	app.route('/album/:id')
		.get((req, res) => {
			if (req.params.id === all) {
				Albums.find({}, (err, albums) => {
					if (err) return console.error(err);
					res.json(albums);
				});
			} else {
				Albums.findById(req.params.id, (err, album) => {
					if (err) return console.error(err);
					res.json(album);
				});
			}
		})
		.put((req, res) => {
			if ( /* check for admin */ 0) {
				Albums.findByIdAndUpdate(req.params.id, {
					name: req.body.name
				}, (err, album) => {
					if (err) return console.error(err);
					res.json(album);
				});
			}
		})
		.post((req, res) => {
			if ( /* check for admin */ 0) {
				Albums.create({
					name: req.body.name
				}, (err, album) => {
					if (err) return console.error(err);
					res.json(album);
				});
			}
		})
		.delete((req, res) => {
			if ( /* check for admin */ 0) {
				Albums.findByIdAndRemove(req.params.id, (err, album) => {
					if (err) return console.error(err);
					res.json(album);
				});
			}
		});
};
