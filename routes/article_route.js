module.exports = (app) => {
	var Article = require('../models/Article');

	app.get('/article/:id', (req, res) => {
		if (req.params.id === 'all') {
			Article.find({}, (err, articles) => {
				res.json(articles);
			});
		} else {
			Article.findById(req.params.id, (err, article) => {
				res.json(article);
			});
		}
	});
};
