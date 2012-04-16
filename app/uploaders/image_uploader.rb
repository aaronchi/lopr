class ImageUploader < ApplicationUploader
  
  version :large do
    process :resize_to_limit => [300,300]
  end
  version :product do
    process :resize_to_limit => [900,250]
  end
  version :medium do
    process :resize_to_limit => [250,250]
  end
  version :small do
    process :resize_to_limit => [100,100]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
