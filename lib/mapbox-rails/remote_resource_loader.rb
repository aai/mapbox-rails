require 'thor'

class RemoteResourceLoader < Thor
  include Thor::Actions

  desc 'fetch source files', 'fetch source files from the MapBox S3 storage'
  def fetch
    self.destination_root = 'vendor/assets'
    get "http://api.tiles.mapbox.com/mapbox.js/v1.0.2/mapbox.uncompressed.js", "javascripts/mapbox.js"
    get "http://api.tiles.mapbox.com/mapbox.js/v1.0.2/mapbox.css", "stylesheets/mapbox.css"
    get "http://api.tiles.mapbox.com/mapbox.js/v1.0.2/mapbox.ie.css", "stylesheets/mapbox.ie.css"
    get "http://api.tiles.mapbox.com/mapbox.js/v1.0.2/images/layers.png", "images/layers.png"
    get "http://api.tiles.mapbox.com/mapbox.js/v1.0.2/images/marker-icon.png", "images/marker-icon.png"
    get "http://api.tiles.mapbox.com/mapbox.js/v1.0.2/images/marker-icon@2x.png", "images/marker-icon@2x.png"
    get "http://api.tiles.mapbox.com/mapbox.js/v1.0.2/images/marker-shadow.png", "images/marker-shadow.png"
  end

  desc 'convert css to sass file', 'convert css to sass file by sass-convert'
  def convert
    self.destination_root = 'vendor/assets'
    inside destination_root do
      run('sass-convert -F css -T sass stylesheets/mapbox.css stylesheets/mapbox.css.sass')
      gsub_file 'stylesheets/mapbox.css.sass', '(layers.png)', "('layers.png')"
      gsub_file 'stylesheets/mapbox.css.sass', '(marker-icon.png)', "('marker-icon.png')"
      gsub_file 'stylesheets/mapbox.css.sass', '(marker-icon@2x.png)', "('marker-icon@2x.png')"
      gsub_file 'stylesheets/mapbox.css.sass', '(marker-shadow.png)', "('marker-shadow.png')"
      gsub_file 'stylesheets/mapbox.css.sass', ' url(images', ' image-url(assets'
    end
  end

  desc 'clean up useless files', 'clean up useless files'
  def cleanup
    self.destination_root = 'vendor/assets'
    remove_file 'stylesheets/mapbox.css'
  end
end
