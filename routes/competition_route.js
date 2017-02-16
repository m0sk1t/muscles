module.exports = (app) => {
    var Competition = require('../models/Competition');
    app.get('/competition/:id', (req, res) => {
        if (req.params.id === 'all') {
            Competition.find({
                end: { $gt: Date.now() }
            }, (err, competitions) => {
                if (err) return res.status(500).json(err);
                res.json(competitions);
            });
        } else {
            Competition.findById(req.params.id, (err, competition) => {
                if (err) return res.status(500).json(err);
                res.json(competition);
            });
        }
    });
    app.put('/competition/:id/add_comment', (req, res) => {
        req.user ? Competition.findByIdAndUpdate(req.params.id, {
            $addToSet: {
                comments: {
                    date: new Date(),
                    name: req.user.name,
                    avatar: req.user.avatar,
                    surname: req.user.surname,
                    comment: req.body.comment,
                }
            }
        }, (err, competition) => {
            if (err) return res.status(500).json(err);
            res.send('OK');
        }) : res.status(403).send('Please, login first');
    });
};