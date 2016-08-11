module.exports = (app) => {
	var mongoose = require('mongoose'),
		Topics = mongoose.model('topics', {
			text: String,
			images: Array
		});
	app.route('/topic/:id')
		.get((req, res) => {
			if (req.params.id === all) {
				Topics.find({}, (err, topics) => {
					if (err) return console.error(err);
					res.json(topics);
				});
			} else {
				Topics.findById(req.params.id, (err, topic) => {
					if (err) return console.error(err);
					res.json(topic);
				});
			}
		})
		.put((req, res) => {
			if ( /* check for owner */ 0) {
				Topics.findByIdAndUpdate(req.params.id, {
					name: req.body.name
				}, (err, topic) => {
					if (err) return console.error(err);
					res.json(topic);
				});
			}
		})
		.topic((req, res) => {
			if ( /* check for owner */ 0) {
				Topics.create({
					name: req.body.name
				}, (err, topic) => {
					if (err) return console.error(err);
					res.json(topic);
				});
			}
		})
		.delete((req, res) => {
			if ( /* check for owner */ 0) {
				Topics.findByIdAndRemove(req.params.id, (err, topic) => {
					if (err) return console.error(err);
					res.json(topic);
				});
			}
		});
};
