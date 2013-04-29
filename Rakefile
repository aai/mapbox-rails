#!/usr/bin/env rake
require 'bundler/gem_tasks'
require File.expand_path('../lib/mapbox-rails/source_file', __FILE__)

desc "Update with MapBox's Mapbox.js Library"
task 'update-mapbox', 'remote', 'branch' do |task, args|
  remote = args['remote'] || 'https://github.com/mapbox/mapbox.js'
  branch = args['branch'] || 'v1'
  loader = RemoteResourceLoader.new
  loader.fetch
  loader.convert
  loader.cleanup
end
