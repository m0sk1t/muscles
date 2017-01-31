var mongoose = require('mongoose'),
    PhotoSchema = mongoose.Schema({
        title: String,
        album: String,
        image: String,
        owner: String,
        creDate: Date,
        likes: { type: Array, default: [] },
        comments: { type: Array, default: [] },
    });

module.exports = mongoose.model('Photos', PhotoSchema);