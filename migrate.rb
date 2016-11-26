#!/usr/bin/env ruby

require 'json'
require 'optparse'

require_relative 'lib/config'
require_relative 'lib/db'
require_relative 'lib/images'

config_file = File.join( Dir.home, '.config', 'publisher.json')
post = 1

OptionParser.new do|opts|
  opts.on('-p', '--post post', 'Post ID id to publish') do |p|
    post = p
  end

  opts.on('-c', '--config-file path', 'Config file') do |c|
    config_file = c
  end
end.parse!

config = JSON.parse File.read(config_file)
staging = Config.new(config['envs']['staging'])
production = Config.new(config['envs']['production'])

# dump staging post
staging_db = DB.new staging.username, staging.password, staging.host, staging.port, staging.database
production_db = DB.new production.username, production.password, production.host, production.port, production.database

post = staging_db.dump post

post['image'] = Images.new(staging.uri, post['image']).work

production_db.insert post
