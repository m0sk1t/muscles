module.exports = (app) => {
	var Article = require('../models/Article');

	app.route('/article/:id')
		.get((req, res) => {
			if (req.params.id === 'all') {
				Article.find({}, (err, articles) => {
					res.json(articles);
				});
			} else {
				Article.findById(req.params.id, (err, article) => {
					res.json(article);
				});
			}
		})
		.put((req, res) => {
			delete req.body._id;
			delete req.body.__v;
			Article.findByIdUpdate(req.params.id, {
				$set: req.body
			}, {
				upsert: false
			}, (err, article) => {
				res.json(article);
			});
		})
		.delete((req, res) => {
			Article.findByIdAndRemove(req.params.id, (err, article) => {
				res.json(article);
			});
		});
};
