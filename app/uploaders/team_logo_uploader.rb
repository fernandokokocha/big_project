# encoding: utf-8

class TeamLogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  process :resize_to_fit => [200, 200]

  version :thumb do
    process :resize_to_fit => [100, 100]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "default_logo.jpg"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "logo.jpg" if original_filename
  end

end
