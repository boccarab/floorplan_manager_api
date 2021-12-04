# frozen_string_literal: true

class BaseUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    # TODO: Set storage for production
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.uuid}"
  end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_allowlist
    [:jpg, :jpeg, :png, '']
  end

  def content_type_allowlist
    %r{image/}
  end
end
