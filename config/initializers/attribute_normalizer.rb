AttributeNormalizer.configure do |config|
  
  config.normalizers[:url] = lambda do |value, options|
    value =~ /^https?\:\/\//i ? value.strip : "http://#{value.strip}"
  end

  # The default normalizers if no :with option or block is given is to apply the :strip and :blank normalizers (in that order).
  # You can change this if you would like as follows:
  # config.default_normalizers = :strip, :blank

  # You can enable the attribute normalizers automatically if the specified attributes exist in your column_names. It will use
  # the default normalizers for each attribute (e.g. config.default_normalizers)
  # config.default_attributes = :name, :abbr, :short_name, :title, :summary, :email, :description, :bio, :short_bio, :caption

  # Also, You can add an specific attribute to default_attributes using one or more normalizers:
  config.add_default_attribute :url, :with => :url
end
