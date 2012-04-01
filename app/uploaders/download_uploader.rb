class DownloadUploader < ApplicationUploader
  
  include CarrierWave::MimeTypes
  process :set_content_type
  
  fog_public = false

end