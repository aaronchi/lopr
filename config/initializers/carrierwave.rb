CarrierWave.configure do |config|

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => Settings.aws.key,
    :aws_secret_access_key  => Settings.aws.secret,
  }
  config.fog_directory  = "assets.#{Settings.domain}"
  config.fog_host       = "http://assets.#{Settings.domain}" # optional, defaults to nil
  config.fog_host       << ".s3.amazonaws.com"# if Rails.env.development?
  
end