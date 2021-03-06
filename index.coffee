#
# Main server that combines API & client
#
# Load environment vars
switch process.env.NODE_ENV
  when 'test'
    env = require 'node-env-file'
    env __dirname + '/.env.test'
  when 'production', 'staging' then ''
  else
    env = require 'node-env-file'
    env __dirname + '/.env'

# Dependencies
express = require "express"
app = module.exports = express()

app.use '/api', require './api'
app.use require './client'

# Start the server and send a message to IPC for the integration test
# helper to hook into.
app.listen process.env.PORT, ->
  console.log "Listening on port " + process.env.PORT
  process.send? "listening"