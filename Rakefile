#!/usr/bin/env rake
require 'bundler/gem_tasks'
require File.expand_path('../lib/mapbox-rails/remote_resource_loader', __FILE__)

desc "Update with MapBox's Mapbox.js Library"
task 'update-mapbox' do |task, args|
  remote = args['remote'] || 'https://github.com/mapbox/mapbox.js'
  branch = args['branch'] || 'v1'
  loader = RemoteResourceLoader.new
  loader.fetch
  loader.convert
  loader.cleanup
end
