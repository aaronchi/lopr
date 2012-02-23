class ApplicationUploader < CarrierWave::Uploader::Base
  
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper
  
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage Settings.assets.storage.to_sym

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
end