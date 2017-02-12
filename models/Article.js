var mongoose = require('mongoose'),
    ArticleSchema = mongoose.Schema({
        comments: {
            type: Array,
            default: []
        },
        creDate: Date,
        title: String,
        owner: String,
        text: String,
    });

module.exports = mongoose.model('Articles', ArticleSchema);