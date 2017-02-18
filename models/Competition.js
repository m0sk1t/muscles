var mongoose = require('mongoose'),
    CompetitionSchema = mongoose.Schema({
        end: Date,
        start: Date,
        city: {},
        place: String,
        creDate: Date,
        comments: {
            type: Array,
            default: []
        },
        owner: String,
        title: String,
        country: {},
        sport: String,
        nomination: String,
        description: String,
    });

module.exports = mongoose.model('Competitions', CompetitionSchema);