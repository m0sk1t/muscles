var mongoose = require('mongoose'),
    VideoSchema = mongoose.Schema({
        link: String,
        type: String,
        title: String,
        owner: String,
        creDate: Date,
        thumbnail: String,
        likes: { type: Array, default: [] },
        comments: { type: Array, default: [] },
    });

module.exports = mongoose.model('Videos', VideoSchema);