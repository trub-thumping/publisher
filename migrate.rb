#!/usr/bin/env ruby

require 'json'
require 'optparse'

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
