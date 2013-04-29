require "mapbox/rails/version"

module Mapbox
  module Rails
    if ::Rails.version.to_s < '3.1'
      require 'mapbox-rails/railtie'
    else
      require 'mapbox-rails/engine'
    end
  end
end
