var mongoose = require('mongoose'),
    ThemeSchema = mongoose.Schema({
        title: String,
    });

module.exports = mongoose.model('Themes', ThemeSchema);