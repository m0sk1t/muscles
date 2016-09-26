module.exports = (app) => {
	// add admin check
	app.route('/sports/:id')
		.get((req, res) => {
			if (req.params.id === 'all') {
				Sports.find({}, (err, sport) => {
					res.json(sport);
				});
			} else {
				Sports.findById(req.params.id, (err, sport) => {
					res.json(sport);
				});
			}
		})
		.put((req, res) => {
			Sports.findByIdAndUpdate(req.params.id, (err, sport) => {});
		})
		.post((req, res) => {
			Sports.create(req.body);
		})
		.delete((req, res) => {
			Sports.findByIdAndRemove(req.params.id, (err, sport) => {});
		});
};
