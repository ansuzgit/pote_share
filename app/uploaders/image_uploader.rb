class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [1026, 1026]

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
 
  #デフォルト画像の設定
  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(*args)
  #   For Rails 3.1+ asset pipeline compatibility:
    ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default_icon.jpg"].compact.join('_'))
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end
  
  version :thumb_show do
    process :resize_to_fill => [470, 265]
  end
  
  version :thumb_my_posts do
    process :resize_to_fill => [240, 140]
  end
  
end
