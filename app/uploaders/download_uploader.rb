class DownloadUploader < ApplicationUploader
  
  #include CarrierWave::MimeTypes
  #process :set_content_type
  
  fog_public = false
  
  def process_uri(uri)
    URI.parse(uri)
  end
  
end