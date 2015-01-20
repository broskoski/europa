mongoose = require 'mongoose'

entrySchema = new mongoose.Schema
  term:
    type: String
    required: true
    unique: true
  provider:
    type: String
    required: true

module.exports.Entry = Entry = mongoose.model 'Entry', entrySchema

tagSchema = new mongoose.Schema
  term:
    type: String
    required: true
    unique: true
  provider:
    type: String
    required: true

module.exports.Tag = Tag = mongoose.model 'Tag', tagSchema