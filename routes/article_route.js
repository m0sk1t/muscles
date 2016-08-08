module.exports = (app) => {
	var mongoose = require('mongoose'),
		Articles = mongoose.model('Articles', {
			title: String
		});
	app.route('/article/:id')
		.get((req, res) => {
			if (req.params.id === 'all') {
				Articles.find({}, (err, articles) => {
					res.json(articles);
				});
			} else {
				Articles.findById(req.params.id, (err, article) => {
					res.json(article);
				});
			}
		})
		.put((req, res) => {
			delete req.body._id;
			delete req.body.__v;
			Articles.findByIdUpdate(req.params.id, {
				$set: req.body
			}, {
				upsert: false
			}, (err, article) => {
				res.json(article);
			});
		})
		.delete((req, res) => {
			Articles.findByIdAndRemove(req.params.id, (err, article) => {
				res.json(article);
			});
		});
};
