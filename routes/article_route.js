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

    app.put('/article/:id/add_comment', (req, res) => {
        req.user ? Article.findByIdAndUpdate(req.params.id, {
            $addToSet: {
                comments: {
                    date: new Date(),
                    name: req.user.name,
                    userid: req.user._id,
                    avatar: req.user.avatar,
                    surname: req.user.surname,
                    comment: req.body.comment,
                }
            }
        }, (err, article) => {
            if (err) return res.json(err);
            res.json(article);
        }) : res.status(403).send('Please, login first');
    });
};